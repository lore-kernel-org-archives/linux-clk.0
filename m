Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1525343956-10089-2-git-send-email-tdas@codeaurora.org>
References: <1525343956-10089-1-git-send-email-tdas@codeaurora.org> <1525343956-10089-2-git-send-email-tdas@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 May 2018 15:22:30 -0700
Message-ID: <CAD=FV=WRfctkUtMgtNh=4DT4aZWKFXRfV3YRjMG-qH2sjW8sgA@mail.gmail.com>
Subject: Re: [v7] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	"open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thu, May 3, 2018 at 3:39 AM, Taniya Das <tdas@codeaurora.org> wrote:
> +       rpmh_client = rpmh_get_client(pdev);
> +       if (IS_ERR(rpmh_client)) {
> +               ret = PTR_ERR(rpmh_client);
> +               dev_err(&pdev->dev, "Failed to request RPMh client, ret=%d\n",
> +                                                                       ret);
> +               return ret;
> +       }

Please rebase atop the latest RPMh code (v7).  There is no more
rpmh_get_client().  If you want help doing this, please see
<http://crosreview.com/1042987> which contains all the changes to work
with v7.


-Doug
