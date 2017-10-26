Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 25 Oct 2017 21:41:09 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, robh+dt@kernel.org,
	mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/7] mailbox: qcom: Convert APCS IPC driver to use
 regmap
Message-ID: <20171026044109.GN1575@tuxbook>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-2-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170921164940.20343-2-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:

> This hardware block provides more functionalities that just IPC. Convert
> it to regmap to allow other child platform devices to use the same regmap.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
