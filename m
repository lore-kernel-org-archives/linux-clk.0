Return-Path: <linux-pm-owner@vger.kernel.org>
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Kevin Hilman <khilman@kernel.org>,
	Grygorii Strashko <Grygorii.Strashko@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] PM / clock_ops: Print acquired clock name in addition to con_id
Date: Tue, 16 Jun 2015 01:40:26 +0200
Message-ID: <1705343.tpqJERUjcf@vostro.rjw.lan>
In-Reply-To: <CAPDyKFrXNOCKg0qsbzCbVnk5d37wBGw-A_Yo1ejv1KjPOVkNcg@mail.gmail.com>
References: <1432917331-3285-1-git-send-email-geert+renesas@glider.be> <CAPDyKFrXNOCKg0qsbzCbVnk5d37wBGw-A_Yo1ejv1KjPOVkNcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thursday, June 04, 2015 11:27:01 AM Ulf Hansson wrote:
> On 29 May 2015 at 18:35, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Currently the con_id of the acquired clock is printed for debugging
> > purposes.  But in several cases, the con_id is NULL, which doesn't
> > provide much debugging information when printed.  These cases are:
> >   - When explicitly passing a NULL con_id (which means the first clock
> >     tied to the device, if available),
> >   - When not using pm_clk_add(), but pm_clk_add_clk() (which takes a
> >     "struct clk *" directly).
> >
> > Hence print the actual clock name in addition to (and not instead of;
> > thanks Grygorii Strashko!) the con_id.
> >
> > Note that the clock name is not available with legacy clock frameworks,
> > and the hex pointer address will be printed instead.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Queued up for 4.2, thanks!


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
