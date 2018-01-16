Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU4zyKvpMbbJpOTxnMtACEQc_X9yWceUoB3xUp3RcFWvg@mail.gmail.com>
References: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
 <20180111211948.GL28313@codeaurora.org> <CAOMZO5BfDRsO=gn_SjkDa_09KEf_EjZcfM5VQawaR1-dQE0o0g@mail.gmail.com>
 <CAMuHMdU4zyKvpMbbJpOTxnMtACEQc_X9yWceUoB3xUp3RcFWvg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Jan 2018 07:45:07 -0200
Message-ID: <CAOMZO5DN_hqs+FaE6=3g2StoaHbGJKYyzaExAPCX45rKEvVOew@mail.gmail.com>
Subject: Re: Warnings from drivers/clk/clk.c
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Sascha Hauer <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

On Tue, Jan 16, 2018 at 7:42 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> I believe you can just replace WARN_ON() by WARN(condition, format...)?

Yes, this looks nicer. Thanks for the hint!
