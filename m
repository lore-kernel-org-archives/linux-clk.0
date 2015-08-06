Return-Path: <abrestic@google.com>
MIME-Version: 1.0
Sender: abrestic@google.com
In-Reply-To: <1438868890-7810-1-git-send-email-govindraj.raja@imgtec.com>
References: <1438868890-7810-1-git-send-email-govindraj.raja@imgtec.com>
Date: Thu, 6 Aug 2015 09:37:05 -0700
Message-ID: <CAL1qeaHLqj+vicU8FbxSnJW81STP4uPbOMnM5m42ecBJu1Vokg@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: pistachio: correct critical clock list
From: Andrew Bresticker <abrestic@chromium.org>
To: Govindraj Raja <govindraj.raja@imgtec.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-clk@vger.kernel.org,
	Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, Zdenko Pulitika <zdenko.pulitika@imgtec.com>,
	Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>,
	James Hartley <James.Hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>,
	James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Govindraj,

On Thu, Aug 6, 2015 at 6:48 AM, Govindraj Raja
<govindraj.raja@imgtec.com> wrote:
> From: "Damien.Horsley" <Damien.Horsley@imgtec.com>
>
> Current critical clock list for pistachio enables
> only mips and sys clocks by default but there also
> other clocks that are not claimed by anyone and
> needs to be enabled by default.
>
> This patch updates the critical clocks that needs
> to enabled by default.
>
> Add a separate struct to distinguish the critical clocks
> one is core clock(mips) and others are from periph_clk_*
>
> Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> Signed-off-by: Damien.Horsley <Damien.Horsley@imgtec.com>

Since you're the one sending the patch, you should include your Signed-off-by.
