Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1E3D2FF0
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876255; cv=none; b=RoND9roNUNhZuyiYwxTmOHw6a+vF10J6g0ruUaAZFjwmdjjfVaouvOP8aTXmBVjP+/ErbyCEkKBRs3x1IZnJrcc9YDugxWCZ4SFxB2HO4E13RsxKciF8Pq9eutM0NpxpidwDJAylHOtvrm748vsSjaZgv53BYjjoxNgquavGeXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876255; c=relaxed/simple;
	bh=bOocalcPpu0KQjrUDLZSBzmP9r5Zgf9mfMe/MLu/tKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6zskIdLFwGOoftIUlqbeWRjgEpwm+r04xXmo9/V2rowSn/lSR1B/EFOPSZN0hxf60d9SJyQslBhYARoVul/J399dIuq0xjIsTxkBLkyEbQCODZHD4gHzy2pm6Z+isDDLjvNfQ0Kxq1M27pfL+0yDQyGTEqKm2n3iRN3VTEM0s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPHcXKbp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ycxv6VvQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPHcXKbp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ycxv6VvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774876253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N6kH+88JrqlfOND0jjbov2Nsohrt5nnjk0qLVmg5Ovw=;
	b=dPHcXKbpC9Iq/eJS/NLVrj3ueTnV8yI4mTuQZfdAvgWmIpFqwM6iJHI9fNy4pmI75l4PM/
	imRFN93JO1/dT2DJXJAdouf7j0QEWlcRF9T2Nutox32KSxUrQcn269wexgXIpggOXDVbzF
	r1iSv57OQ6jlu2cZ4/pkbzy0fSWRTcE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-864wPrOdM7-msfkhu3Iiwg-1; Mon, 30 Mar 2026 09:10:52 -0400
X-MC-Unique: 864wPrOdM7-msfkhu3Iiwg-1
X-Mimecast-MFC-AGG-ID: 864wPrOdM7-msfkhu3Iiwg_1774876251
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ffce20deaso82372276d6.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774876251; x=1775481051; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6kH+88JrqlfOND0jjbov2Nsohrt5nnjk0qLVmg5Ovw=;
        b=Ycxv6VvQIvRTfUbKqfJ+2ehemXwC8M3bsxFZAKHHlBaiU+M7zEd3SNjFFpnMg+RdHd
         +eGReLZf8Znies4rXSrFCWMExLaiejmUbbCrwM3StS1aS2TlbLkhk6K2Ubw36I0tLRPK
         O/zHFt2Pwz+I6+P0bEvn04LXltK+SlOv/utRj9qIPoy3brwViky+P+gFYuu0QBap/WNU
         AvsPlDOFDOvSr8t20IuIg1JT/6eZ65TeyBsl2Ep/2rAKnl8LdBbXnMJu0lCmuxhGGdp4
         Ul/KIuT8Ch+U2mUQibI5RhwB4AleaKOVUjvGDPSmxclfByy9SoR+QkeP84ti/rAaNsQC
         59VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876251; x=1775481051;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6kH+88JrqlfOND0jjbov2Nsohrt5nnjk0qLVmg5Ovw=;
        b=WOOXlfjeLxg3Uk8akNcF6j9IMDUP1BHfZhpVRR8iOG2Uq4Q04ja/zyyO2dwHwyc3yK
         7y2FztvPkcsEVx7XPBcXXllMkLFIRzKb/E8BY8est/Fgbk4zadmmSj9vAlj6JASXXepN
         WCfRDff6xaEqCO4plbd4Qi1q99mAcWPanKgALol79gZl+M0FJxRZrxRhlfQorYEAnen7
         inhPsYWxHx2ODQ1tnwXgnTa2RkSjMnrsDGTUUMlgnLs0AJmmsp0SvuC8Ilfe8c/a4h3B
         CiaSZqN6XBUOB1+fEuEzWQUgMadLJAXHSdrcuF5lgLORmXjR1PxRJgI3zPirt/QjENUH
         GHCg==
X-Gm-Message-State: AOJu0YzH+GlZMrjSs3Ru1uspJaQHSkvHD4PciW/k99AvgGr7pQQK00sh
	8HkD10io0Lb31UJkpdYJViQef/RwiytuHA9/gXahr2rnoxj06vbGNtRFlaLu5VnAYsrUXklNJ49
	N1gE0v0cmskfOAX5ntCuyGMDuA57mxtpmB00kljaJoMXUtlY2+RsYh4eZUmxMkA==
X-Gm-Gg: ATEYQzwkmXtrgqVuixriQKppDE/dqcczLT+md9lB+D8pF+lsnN5odvNR8uWb+zSVix6
	FjJtEwhLfUSehbyENdx5cwGPBhCzIzEadqpU1EZzWkOy3ONx/YKr+OWTPuvWevOtoibyrfM3qRF
	ef/iHAP26ZgV7LQ0Yu6tuWkDbsrpH0EKuC4g+O6ElPBDOm25yTktA1HKUcRuUdsN3UzRaCmXSlm
	mvfosAfJlPzvTOTpyNrdOcLl5t1prcMZ6oU/2VQqgOLXf/l74MUN/hQW7N/vm2i0WoMJVCwx43T
	rTokuxbQjMOCQPNspaaGvyKVI4d2NkzbiuVvmQ1Pb7hN/U0CwXijqbHaQoAruy3ZtGPMD9kQdXC
	EbMq/vgPGZCuLycrp6luA/AhPUVRPvir6WnHyDmc6/2p/bR2GDF/EJ+nf
X-Received: by 2002:a05:6214:4402:b0:899:ef63:9a86 with SMTP id 6a1803df08f44-89ce8cbd43cmr195600966d6.7.1774876251443;
        Mon, 30 Mar 2026 06:10:51 -0700 (PDT)
X-Received: by 2002:a05:6214:4402:b0:899:ef63:9a86 with SMTP id 6a1803df08f44-89ce8cbd43cmr195600246d6.7.1774876250830;
        Mon, 30 Mar 2026 06:10:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbda4d50sm61748316d6.15.2026.03.30.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:10:50 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:10:48 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: bcm: iproc-asiu: simplify allocation
Message-ID: <acp2WE84FJ8Ts6Cq@redhat.com>
References: <20260326045324.240150-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326045324.240150-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Wed, Mar 25, 2026 at 09:53:24PM -0700, Rosen Penev wrote:
> Use kzalloc_flex and a flexible array member to combine allocations
> 
> While at it, take clk_data out of the struct and move it into probe.
> It's not used anywhere else.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

