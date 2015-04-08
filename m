Return-Path: <nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1428416091-31844-1-git-send-email-georgi.djakov@linaro.org>
References: <1428416091-31844-1-git-send-email-georgi.djakov@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 8 Apr 2015 10:38:41 +0200
Message-ID: <CAP71WjxnL0_AUSYmMuBPLs+teWeC6rMuO7S8L8to1cWvnM2FBg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: Fix parent_map translations
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 7, 2015 at 4:14 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
> When we introduced the parent_map tables, we missed to update some
> of the functions where mapping is translated. Fix this.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>
> Changes since v1:
>  * Pass parent map to _freq_tbl_determine_rate()

tested this v2 as well, on ifc6410, I have done the same functional
tests as mentioned in [1].

Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

[1] https://lkml.org/lkml/2015/4/3/298
