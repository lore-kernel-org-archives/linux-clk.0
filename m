Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742AF28000C
	for <linux-clk@vger.kernel.org>; Tue, 26 Aug 2025 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756209179; cv=none; b=WEZHHakFk8k4+F4Hvbr7Sgn1I8V/gDPXnlsm2S61+YjKzIQw4n+HCwBx1pdHDU2ADIrYXAhg4lv0VjLYXuTOfKXwWg8Q2FcwWuVCslVgzBKZOPEDnn/7VC/5XZe0R7i/QwnZ6ALflKH8mcptGywObrJKgMZf97vqyso8b8XBLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756209179; c=relaxed/simple;
	bh=GR8wOyKl4HbIY5koqYX6Qcxm/LL8C7IpL8DFj8Soc1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c31EpLTmo1fM2oovnUgjo2jH3VrBoGqUASVStceCdGa4bTYbQ8sCs82d0Fjrr4nMlVbZZ978XDe7xtTTKWqE6SXYKKTcHiqGD0KzX4dvPTE+jolzSoIrcrKOYenuRl0k7Y8eKGIKWD8S0t4VN66wW5qEl0zTFoR/yGpXZzCSO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OGb3eJS5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OGb3eJS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756209176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e53lcb42G3RVNhjNWPFwju1PJTH1cjj9lH1MqnWkPUw=;
	b=OGb3eJS5HaMnsnwILZORtvCVe11rE6PZnS8H9bto0aciOkEcLf1CBZycrRC9k3d6DClH6P
	EReDPPMTehSvJ8906fnKTmBswQALdSmVr9Mg7s2GgePM/KPR4jZ6eyg3HI6uzvm3FuSrnx
	1kp2Ij7LNxjyrO+IxWMfXdwblBncZ6A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-bJoPvQFoNo2PkQegnX7JEA-1; Tue, 26 Aug 2025 07:52:55 -0400
X-MC-Unique: bJoPvQFoNo2PkQegnX7JEA-1
X-Mimecast-MFC-AGG-ID: bJoPvQFoNo2PkQegnX7JEA_1756209175
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e870315c98so1962822685a.0
        for <linux-clk@vger.kernel.org>; Tue, 26 Aug 2025 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756209174; x=1756813974;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e53lcb42G3RVNhjNWPFwju1PJTH1cjj9lH1MqnWkPUw=;
        b=inWKewqqna5FnDMGw+OEJNafy3NfESR2k5yFsVPLCD/b/BQ4o76u2M5w8+b1eCbBmN
         IgAv/IVd0K4evwD4G0Cci/V0hPNwJQMp6um0tUqI9hHUvZRyAtUOojd4T8+2BXu0oDzG
         p5y9Ft0xI1/rsffA9k0LnG84AbiAB6usZ91lKCLhC67J5q2VP/0KYBysNMNRelRuNVSS
         WYLuu9g7/6OFV4fMpmwjkvLSakIdfvHPst8TywhKrmKZCm9lv6cMt8VMyHOdrqAjp6wP
         NfFwXGv2hjviADpYoIO3tkv/pEJI/NpD2PdPraAdLMlRieCLE5YrFwFrdcMzaCCwQwsv
         mJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQcvllh/eLHTOb8kTW7kk4MRenfFj0/NLGOCbCp8MgUQrCwrTXopbhuGWQdz6jvuhap8UKu9crsP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynWAm68cNj/8UW0XXlahA83TiUOCf1PAiCyS+0VnabSvto/86l
	DYZkYi4t41eduB/rNrZBd7wPVU+LlHu8xTt+8SJFe6BdDwqCg3qgaAuR4jo6JV+Dst3X4g4Gf/g
	Etov1N/JxMqEoWYHONAHV/vkwjcyq8SZfRGfObhP3a7cIXgcbtDGSgGYI7y9aNw==
X-Gm-Gg: ASbGncu+DNcctEyBljDj3JADqW2QPweB9fLjMLr3Pgn16DqJse0cmYq04jwSFEHK72W
	hpgp3NPaoV7jDSjFwm93LqalAp1znznYKjtQ+QKmjbMnav1NC5hZC/KScxA5Lf2GYn3YUGqpS+D
	etxDdo/IPmYBbDYE+P/PdHn7aQ3zc/2mD2RtRQTa0El86YedsrMWbnLbYWJ5m1yMW23s16CNTYK
	3IXAByMSoDBbaqjErcQy4tIm4UdLVdkMO4j9KXMjjiUzy/hN7WlaTrJeKWh9M7I/q3PRQ2+Tf/T
	sVtLAgek45x2v3MWvoDibINvsM/N47MfbRr9k6Wyy7V0xHbg4yQK/uLFRm4BcB7d4BL6OwEiHMR
	cHemlqh9xCPeqYu7CcM8=
X-Received: by 2002:a05:620a:a903:b0:7e9:f81f:ce91 with SMTP id af79cd13be357-7ea110a5fc6mr1545015285a.83.1756209174582;
        Tue, 26 Aug 2025 04:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEES/HvFR76larcT3Nn6nir0QLpsUJq2+C9kWe3HGsFZh8ETnB9k+QXuGo4sEteZ1xDZAs8Sg==
X-Received: by 2002:a05:620a:a903:b0:7e9:f81f:ce91 with SMTP id af79cd13be357-7ea110a5fc6mr1545012785a.83.1756209174056;
        Tue, 26 Aug 2025 04:52:54 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebecb1825bsm661572385a.10.2025.08.26.04.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 04:52:53 -0700 (PDT)
Date: Tue, 26 Aug 2025 07:52:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
	linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aK2gE0CysSWisFwB@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
 <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Claudiu,

On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
> On 8/25/25 20:05, Brian Masney wrote:
> > On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > This series disables clocks that remain unused after resume.
> > > This is necessary when the resume process is done with the help of the
> > > bootloader, as the bootloader enables various clocks when returning from
> > > resume.
> > > 
> > > On the RZ/G3S SoC (where this series was tested), the bootloader enables
> > > the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> > > 1 is unused) and the clocks for a serial IP (unused by Linux).
> > > 
> > > Testing was done on the RZ/G3S SMARC Carrier II board.
> > 
> > Do you think that other boards would also benefit from this change? If
> > so, what do you think about putting the call to register_pm_notifier()
> > inside an __init block in clk.c so that this same change doesn't have to
> > be implemented across various clk drivers?
> 
> Yes, that was my other approach I was thinking about. I wanted to see how
> other people consider this version.
> 
> > 
> > Alternatively, if this is board specific, could this be fixed in the
> > boot loader so that the clock that's not used by Linus is properly shut
> > down on resume?
> 
> As a result of your request I did some more investigations on my side, I can
> say that, yes, in theory that could be also handled by bootloader.
> 
> I can drop this and try to do it in bootloader, if any. Please let me know
> if you still consider this (or the variant that implements it in a generic
> way) necessary.

Personally I would go the route of fixing this in the bootloader for
this particular platform.

If this issue affects other platforms, particularly across multiple
SoC vendors, then I think it would be worthwhile to have a discussion
about adding this functionality to the clk core.

Brian

