Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF2392809;
	Thu, 22 Jan 2026 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769109979; cv=none; b=NYOKbhlGtKdE2x/3dlcVsToUtLfqO20a4WKUJd2Q2eTZ5diazhqYPN/hzFOdmnArb4XLeFplydNXhzRSQVaMIYeD3cyyKG2jBRQAtPc5sqhNc47rkpKiU7S4ME+IrDSjgCz7OhQIFIgsagTVgGDtHrPRP4Nm3AlpIleyj2W7CjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769109979; c=relaxed/simple;
	bh=zxxq46v5js8lUD8p0sx9+eGgFG6sU+S22vthEVmEdjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9/59b74lnRbZRLKzeNOpucGCVHYWseOlFFPGoaQwiSPk8jrvJuXequSwwF2BV6tZuCxFg0B2LPx9MGwxaV+voGwt0TE6cR1ScGz5vEB5DYbG2j3gkf/tRH/bUFz4DtVnyurg207x6ojNVq91otfTGbM/Mg0o3666P6UMDbP+HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ebpqZnaf; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ebpqZnaf"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FE9110D9BD;
	Thu, 22 Jan 2026 20:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769109968;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Wz6lkBEoBXvIqyOZ6bUTu0I2QkHz950er/oSi1wDSSk=;
	b=ebpqZnafk6S3u70+36FIAojJmLevDfR1tcdtZKYEMCnEoy/mZJLrrBaSWKQ5CXBTC35GpM
	kAYBkWeowZdvjOCatE5SrSQZI+Bmy/fyxDhlhAvFzFpgntdWpG18unHm7TFqJ/vmQt3TnW
	1L3Bks4xg+XOSq09udIw1O9bvT7XvW8912kjyrMQZDuiGeXa6md1fKlycSpk5HmO2MkgCf
	sa5W3ho+TZNFaZ09gAwicQKp+SM/RoXa0ZXuMlkbmCZnPZvIKns8yZFDhYFZCDLrownw+p
	CBE4ZbRYtRWqgu8vpgjYcgpe1NSdz+W26bDuOg5ziihAT40kn/sd+cWbXD7h4w==
Date: Thu, 22 Jan 2026 20:26:03 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2
 switch
Message-ID: <20260122202603.36ed7944@wsk>
In-Reply-To: <20260122-unlaced-porthole-1983bc69c03c@spud>
References: <20260122125838.4144700-1-lukma@nabladev.com>
	<20260122-unlaced-porthole-1983bc69c03c@spud>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Conor,

> On Thu, Jan 22, 2026 at 01:58:38PM +0100, Lukasz Majewski wrote:
> > This patch adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
> > macros definitions for L2 switch.
> > 
> > Those definitions describe clocks for MoreThanIP switch IP block;
> > the switch itself and the MAC address lookup table clocks.
> > 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> >  include/dt-bindings/clock/vf610-clock.h | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/dt-bindings/clock/vf610-clock.h
> > b/include/dt-bindings/clock/vf610-clock.h index
> > 373644e46747..b6f7b1745cc2 100644 ---
> > a/include/dt-bindings/clock/vf610-clock.h +++
> > b/include/dt-bindings/clock/vf610-clock.h @@ -197,6 +197,11 @@
> >  #define VF610_CLK_TCON1			188
> >  #define VF610_CLK_CAAM			189
> >  #define VF610_CLK_CRC			190
> > -#define VF610_CLK_END			191  
> 
> If end is modifiable, it is removable. If you need the define for the
> driver, please move it there.

Could you be more specific regarding your comment?

The VF610_CLK_END has now value 191.

However, there are other clocks in this SoC - like CLK_ESW and
CLK_MAC_TAB{x} - which were not taken into account earlier.

What shall be done?

Shall I remove the VF610_CLK_END entirely?

Or move to the new "end" (as done with this patch)?

> 
> pw-bot: changes-requested
> 
> > +#define VF610_CLK_ESW			191
> > +#define VF610_CLK_ESW_MAC_TAB0		192
> > +#define VF610_CLK_ESW_MAC_TAB1		193
> > +#define VF610_CLK_ESW_MAC_TAB2		194
> > +#define VF610_CLK_ESW_MAC_TAB3		195
> > +#define VF610_CLK_END			196
> >  
> >  #endif /* __DT_BINDINGS_CLOCK_VF610_H */
> > -- 
> > 2.39.5
> >   


-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
