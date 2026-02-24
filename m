Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC293A7830
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954054; cv=none; b=NNDpb8LkHx9p+Fxs4U4OlLZnwAK2DEDTH3+lvZ6iFOEwDrUPVWga4ISs03VYBlFQXjr6jGhoyDZXI49QGMnY2DL7BRp5YK5VThv7Z7bG6N95Yyxoo/kP8eAdK2IHS8YnVUTjNEQT06eGH6wUYTMflXK6bSXIePXlz9ikQbKNwqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954054; c=relaxed/simple;
	bh=CFNcgT5tTeQlPUmrqPT3KTvOxfvrh7kc3JhWiYY0w54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rM8jzd+RK8b8/8bmqvnwde8DygYc7feBrXoMcNbHqhRU9tb/SCp7yidIgxpNT1rBWmBoCk6ZUT9uZfot6Zx65KU663c882pMDLefC28SPpLlT/UJtYynDkJRjxTbo6kvHLID3Kd4JXXkRjz9NewvZigjZlJVMRnzVnvd07Vu87s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmW9nw9R; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1zhMF4X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmW9nw9R";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1zhMF4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771954052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xn0/IHpnvVZQzpCmT4NuXRsMwOR3rQ6bDNrVNdr8+MM=;
	b=SmW9nw9Ra5Fj3UHoaVSo+pylsfbAakyRc11BDRT9llYXbKXsliDuuSIzq/xXJIFngp5Lac
	ANP7utuJHduDPuLhOW2doKcdBetnHmwtm9FEc9P2DgdFBHfEQXwC49cPJD1IFsIR/Hrkpi
	JMkw4mbyPDGZMISebQoOaidizmoClOs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-0bS8bls9NMuLK2OSKvBNkA-1; Tue, 24 Feb 2026 12:27:30 -0500
X-MC-Unique: 0bS8bls9NMuLK2OSKvBNkA-1
X-Mimecast-MFC-AGG-ID: 0bS8bls9NMuLK2OSKvBNkA_1771954050
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89700915423so90218656d6.2
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 09:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771954050; x=1772558850; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xn0/IHpnvVZQzpCmT4NuXRsMwOR3rQ6bDNrVNdr8+MM=;
        b=V1zhMF4XwwYMNiiuhf3GjA4vE4DrLafZ2CPmnWUEKXD1qazuIt5py2LnPVSn/HebFz
         hMK7Q8Hb31SKxIk2U2LqG46JAYP/725EA7/pqYZ+Rsmw+o/UG7c9MCHSZmfyajkK5OJv
         IzpzIP9bdKluZaSkk2rdmEaw2HOaBUSPgm2IUHJqfLPH88SogmVgSFnnQfQADWieu1H3
         MMv+c9texd0Dv1H+f6P4OzeqtrdSsXt6gu+EYBOazyMvtYH0QuZgWPInh1svkYBM93yC
         CTwxqndUi/Rcv0+6vAM2i6+kTlp0xJpNcfdo8QcC3jcle4vzHL+lnUZGUyY6lh6YmqM7
         WAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771954050; x=1772558850;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xn0/IHpnvVZQzpCmT4NuXRsMwOR3rQ6bDNrVNdr8+MM=;
        b=PQeem07DYRWohpQamgxgKB7Pf8YG24KtJWoCI9ifRACCWZSTAnFT6TEM91+ZQZbGeh
         N3LaoUWoFBO6pVNX20xyoT+53QdCW3TyOx0REz479kY1cFF2XvcsK00BePljCDIw+bRD
         qvnYoJXe21hbRusPHTsHNwnxUgStvG/7h6Qb766E8U42TdcBQSDOIWy1UiKwNfWWVdNT
         xJY2Ys0H7GiOJvjoiPWExdFZD7mJRf2ruP5ls6nuH4qb3FNihRvHAQ/H0mI9I3N+fgPN
         OdAObkjoIK9TL1eSrjGQWCIM2XzPQAn/+4VPQTi2aiw1WjeeK9hKh2CX6FucBXgSbu54
         uvtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu0/JLLfjA5VslWmDpjFgHAvE68ipXKWR5I4/BBP3eZc8gjNeL5JtdwYEXDDY4ZHQNTIi7XzQj6Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdPV8OkFHfdXWCqNTn8y8j1nVt6oA/PRliPb4RGq8jO8cUGib1
	GyZ19fP8pRSJOzWdkH3+hCeb9+mBfuL31EjGpz8C/SC7YGEw/8zAi48Y45lH9DhPmEjBOl6CvfN
	kae1r9Y8IFUQS0QeLqpX7scCatC7sFdwPmoQGoNaQfmdDsVH75gfz9n+hZzcNlQ==
X-Gm-Gg: AZuq6aKoroCPVT3WB8P1Ep10ol9CufvWw2siUCDg0BESjoEram3ZUt8/B7sRdEUHlyt
	xvBpPMYUj/WsvZoh7G3HZQtjCGTs6GPFGhLgrSVV716k9SaCkIwG8FQjFbGh8+xBvWuIVV8RX8j
	b5J4gtBQ9kaaXP3+KyNKtVVN8EfId2Cz5IvhoyIRsFCBjItRdVQowAuIn01Z8lTh7bGDPyUpVnO
	JiMPj6JndU2kSKxtF1VJ0hEuut9Q8BJqwPniEwLHlntjRDs3bFUTvivkVhoUM+smqWdEeFULRud
	kOgzWmJU2XVzqu/7zaBWPqQpIqP78c6eIvFCH1Kb7PVTgLIZumTLi0Hs9CeOvhHc1q2e3n2ykir
	SM68Bx1pdY5yH8XAhE0TyjXINljGyPpCHFm8G+zDpXS1QA/3+K1hiWggj
X-Received: by 2002:a05:620a:4150:b0:8c9:f996:8203 with SMTP id af79cd13be357-8cb8c9cde5bmr1776867385a.13.1771954050040;
        Tue, 24 Feb 2026 09:27:30 -0800 (PST)
X-Received: by 2002:a05:620a:4150:b0:8c9:f996:8203 with SMTP id af79cd13be357-8cb8c9cde5bmr1776858785a.13.1771954049089;
        Tue, 24 Feb 2026 09:27:29 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d063f0dsm976280585a.15.2026.02.24.09.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 09:27:28 -0800 (PST)
Date: Tue, 24 Feb 2026 12:27:27 -0500
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aZ3ff9vq9yuCkwTQ@redhat.com>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
 <20260224-placate-runt-54aa8419ec40@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-placate-runt-54aa8419ec40@spud>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Feb 24, 2026 at 05:10:42PM +0000, Conor Dooley wrote:
> On Sun, Feb 22, 2026 at 06:51:03PM -0500, Brian Masney wrote:
> > Here's a small series that lets us enable COMPILE_TEST for the pic32 clk
> > driver so that this driver can be compiled on all architectures in the
> > future to help avoid breakage.
> 
> Why do you care about this platform? Originally I thought you cared cos
> you were getting involved in clock subsystem stuff, but I see you doing
> stuff with it in pinctrl etc. Is that just general cleanup work, or do
> you actually have an interest in the platform?

My sole interest is to clean up the clk driver, which spilled into
larger work to clean the include header to allow this driver to be
compiled on other architectures. If I was going to do this for the
clk driver, it wasn't that much work to do the other pic32 driver
cleanups while I was there.

Honestly, I hope to done with all of these pic32 drivers after what I
posted this week has been merged.

> Also, seeing "clk: microchip: core" in my inbox triggers me, cos the
> stuff I work on uses "microchip: core" a lot for FPGA IP cores. Can we
> do:
> 
> -- >8 --
> From 5e972ac119c87257ce141382019f2b58ebd53359 Mon Sep 17 00:00:00 2001
> From: Conor Dooley <conor.dooley@microchip.com>
> Date: Tue, 24 Feb 2026 16:59:53 +0000
> Subject: [PATCH] clk: microchip: rename clk-core to clk-pic32
> 
> clk-core is a confusingly generic name, since it is only used by a
> single platform and it uses very similar naming to the "soft" IP cores
> for use in FPGA fabric (CoreClock or similar is what that would be
> called, although nothing like that exists right now) that the FPGA
> business unit produces. Rename it to clk-pic32, matching the prefix
> used by most functions in the driver. As far as I can tell, impact
> on whatever users may (or may not...) exist for the platform is minimal
> as it's built-in only and the functions are called directly from
> clk-pic32mzda.c
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

That sounds good to me. Please post that as a separate patch.

Brian

