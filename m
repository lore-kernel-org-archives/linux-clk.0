Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rajendra Nayak <rnayak@codeaurora.org>, mturquette@baylibre.com,
 sboyd@codeaurora.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org,
 architt@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>
References: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
Message-ID: <152123964568.242365.7234751069811790746@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 0/3] clk: qcom: msm8996: handle mmagic gdscs and clocks
Date: Fri, 16 Mar 2018 15:34:05 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Rajendra Nayak (2017-10-11 23:58:46)
> With no bus driver to handle the mmagic bus clocks and gdscs on msm8996,
> its best to just turn them all ON at gdsc/clk driver probe and leave
> them ON thereafter. This should unblock a lot of multimedia support on
> msm8996 which rely on these to be ON and have no way to control them at
> this point. Once we do have better noc/bus management drivers in place
> we can avoid leaving these ON always and turn them ON/OFF as needed.
> =


This series is old. I'm marking it as rejected in patchwork and you can
resend if you want to and we can discuss it then.
