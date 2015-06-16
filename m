Return-Path: <pebolle@tiscali.nl>
Message-ID: <1434438845.2069.46.camel@x220>
Subject: Re: [PATCH 4/5] clk: qcom: Add A53 clock driver
From: Paul Bolle <pebolle@tiscali.nl>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, mturquette@linaro.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Date: Tue, 16 Jun 2015 09:14:05 +0200
In-Reply-To: <557EF0EB.9040403@linaro.org>
References: <1434098519-26406-1-git-send-email-georgi.djakov@linaro.org>
		 <1434098519-26406-5-git-send-email-georgi.djakov@linaro.org>
	 <1434376712.2069.5.camel@x220> <557EF0EB.9040403@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2015-06-15 at 18:36 +0300, Georgi Djakov wrote:
> In general, it is not expected to unload it as this is for the
> main CPU clock, but i will add a module_exit() call to make it
> correct.

It's not incorrect to not have a module_exit() call. But not having it
means you can't (easily and cleanly) unload this module. Which is
uncommon enough for me to inquire whether that was by design.

Thanks,


Paul Bolle
