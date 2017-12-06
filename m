Return-Path: <linux-kernel-owner@vger.kernel.org>
From: srinivas.kandagatla@linaro.org
To: sboyd@codeaurora.org, linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] clk: qcom: gcc-msm8916: codec digital clk fixes
Date: Wed,  6 Dec 2017 12:11:37 +0000
Message-Id: <20171206121139.18936-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Stephen, 

Found few issues while trying to set 12.288MHz on codec digital clk.
One is to do with missing mnd_width and other is missing clk entry.

thanks,
srini

Srinivas Kandagatla (2):
  clk: qcom: msm8916: fix mnd_width for codec_digcodec
  clk: qcom: msm8916: add 12.288 MHz support to codec dig clk

 drivers/clk/qcom/gcc-msm8916.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.15.0
