Return-Path: <abrestic@google.com>
MIME-Version: 1.0
Sender: abrestic@google.com
In-Reply-To: <1438868811-7769-1-git-send-email-govindraj.raja@imgtec.com>
References: <1438868811-7769-1-git-send-email-govindraj.raja@imgtec.com>
Date: Thu, 6 Aug 2015 09:31:04 -0700
Message-ID: <CAL1qeaG5+cB1Hw-s-p_9_zM5TK6ZOeNrMP5oAspbrgsY=_V89g@mail.gmail.com>
Subject: Re: [PATCH 5/6] pistachio: pll: Fix vco calculation in .set_rate (fractional)
From: Andrew Bresticker <abrestic@chromium.org>
To: Govindraj Raja <govindraj.raja@imgtec.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org,
	Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, Zdenko Pulitika <zdenko.pulitika@imgtec.com>,
	Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>,
	James Hartley <James.Hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>,
	James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Govindraj,

On Thu, Aug 6, 2015 at 6:46 AM, Govindraj Raja
<govindraj.raja@imgtec.com> wrote:
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
>
> Vco was calculated based on the current operating mode which
> makes no sense because .set_rate is setting operating mode. Instead,
> vco should be calculated using pll settings that are about to be set.
>
> Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>

Shouldn't this be squashed with patch 3/6?
