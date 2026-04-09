all: report/report.html

report/report.html: report/report.Rmd \
  output/position_pts_anova_results.rds \
  output/position_pts_summary.rds \
  output/age_mins_regression_results.rds \
  output/games_dreb_regression_results.rds \
  output/box_plot_1.png \
  output/scatter_plot_2.png \
  output/scatter_plot_3.png
	Rscript -e "rmarkdown::render('report/report.Rmd', output_file = 'report.html', output_dir = 'report')"

output/position_pts_anova_results.rds \
output/position_pts_summary.rds \
output/age_mins_regression_results.rds \
output/games_dreb_regression_results.rds: code/01_analysis.R data_clean/nba_combined.csv
	Rscript code/01_analysis.R

output/box_plot_1.png \
output/scatter_plot_2.png \
output/scatter_plot_3.png: code/Shravya_graphs.R data_clean/nba_combined.csv
	Rscript code/Shravya_graphs.R

## clean: 													This removes outputs
clean:
	rm -f output/*.rds
	rm -f output/*.png
	rm -f report/report.html