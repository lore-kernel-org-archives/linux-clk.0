Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08792874F7
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141546; cv=none; b=bFc+88uzfsLEF1pdbznW0w5MUVRv62MNIQ9C05lOQ9btNNk6Is+zqeIarLEpTJNIi+0ZeCjow3hIxlWwK7kyMHjTdtoiTjQjL0I7zlFS4lTxZgFvTKvwpLKtCpBMGtwvdwJpwVazcGPa2jfUzPBBDuARwl6csLFNBFbGjY7541o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141546; c=relaxed/simple;
	bh=a9DEbmQDFs1ppjiAWwlvOY2MAO6FzDy9K1E/Pyjmmhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQnSVMQdUxeAC0puc6BjE8jTdepLcYUduWUm6ACJTc6b7hAJy4S2p4jakAyw7oVrb4sH42LgUzEkbQSnbCIjcWEBJyTUSt8nkJJ1XZVePBMGK0262cEQv4PqxYXpjol6rB7iRgXOGqYMlPQYKUQv5qTxoUL72ntElRbYnMU27zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cYazCprx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cYazCprx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756141543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvfYaRBOsqgg9T3AWRsCKLpVkMgeI8wkL7WYk9/VCmQ=;
	b=cYazCprx42BX0fEeZkwW84GGNgUABkLY1mDCwnmi253D9t9OhCu+kgPea/SbLVCWXht3+G
	+B/ERt/f/80P1uDYefXYkaaCWETy33DrQDqrZ717K/vx8xXomOzEPBwgudPgU+a3Y+eYj2
	CC5+Vb1Lr/VtSJbgImMNn09aCvC7MIc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-vzma384IMYaHL8MwaZA7pw-1; Mon, 25 Aug 2025 13:05:42 -0400
X-MC-Unique: vzma384IMYaHL8MwaZA7pw-1
X-Mimecast-MFC-AGG-ID: vzma384IMYaHL8MwaZA7pw_1756141542
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9a65c18fso96241686d6.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 10:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141542; x=1756746342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvfYaRBOsqgg9T3AWRsCKLpVkMgeI8wkL7WYk9/VCmQ=;
        b=UA9Styar+nxRZSFNWWBQWL2nzSsCnnvcQByedckzqR93oPOUVpwJPvfohlPrcx1cjj
         PDWMnfPb0TKwdFDdA3I8d61pHViY75AA+3hbrJxrTOBr0EnKBS/Ez52fxLNyBR6vunsT
         llgxe1mlaL/efAGjpDXm4thIZBrO6DcY5LoaO5WuBZtUEdavD4C8f256swRqLQKdHqJ2
         aSnwdrz4svewqNF3kRvBXJu6xPwG9ocoAia2m7ed2hyi1ivpYPVNPbFe/rzg4YTzBqJJ
         RQeaezLltg0lWLJ9o7AlAI539oY8Xj1sAt6ha9s1BDtHAVPiF9xhenml+gYnbtb8rmmp
         xP+A==
X-Forwarded-Encrypted: i=1; AJvYcCUMz3Jp7QwOBl0nFK1kU2ilJmd0glS0ZI/2bWuLTgFx1ab6b6Vt2c7Sc+I+K+mdNDKPBC4FwTsbzPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMoI8OPrVig/Eh7i994ZSGZu9aRkwMAAU7HUfXM+G2b1+lSHc
	0EqelgGL3hnt/ZX5XctrZTmGLU5Bvuy5kfPmRJJ+II3XhdtqCRoHnOOo7LLr0GZZcuUmoIttwsc
	kd/5AlUp8XHdCVq+vQSoq/qjqF8+hbpSFq84NMD8EVd5bwj8WGCHgfCfESMfcPw==
X-Gm-Gg: ASbGncvlZQCGg49zMzpbg2IndkObHqO4nviJo0Kr98ZyNL2mpglqYOnsxd3IqU4vp8h
	NZYSigkzNXG6bZlm5XjGq6guCLrb45oDofi+roVpf4qUKBcetyKPzvkiA5+z639emrdTLFuSV1y
	t/VJ8lN614BvRjMB4pc0gz+uUOBaYoyXSqfUcF8PRmnFonJtCk/QyNKJnCTWl401AwSNqD8mHy7
	MOgevsp0NfyRhiA867cYqFgUe1L1yCS/811is1PngQGCm28kE2ikELuEEhgAMbcnBC2v/jlXwPM
	Dc97cip802DqcsJpdMv899cxeIRJEd6t2QtLCQEwGJv9pTEmiioivkfOnCE1qJIVYjJ5/4dt35V
	qAq723B0Gu1aczusUql0=
X-Received: by 2002:ad4:5ec5:0:b0:70d:ad2e:cedb with SMTP id 6a1803df08f44-70dad2ed081mr83964596d6.43.1756141541424;
        Mon, 25 Aug 2025 10:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnj7pgLgYj0gnzZFl+kk2EVSGRa08xMAzv363arIwLdssNid6xlYMbYTH85va++EtXnTmBAA==
X-Received: by 2002:ad4:5ec5:0:b0:70d:ad2e:cedb with SMTP id 6a1803df08f44-70dad2ed081mr83963686d6.43.1756141540665;
        Mon, 25 Aug 2025 10:05:40 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da714727csm48194826d6.13.2025.08.25.10.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:05:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:05:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
	linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aKyX4YJswZLuqA6Y@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Claudiu,

On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series disables clocks that remain unused after resume.
> This is necessary when the resume process is done with the help of the
> bootloader, as the bootloader enables various clocks when returning from
> resume.
> 
> On the RZ/G3S SoC (where this series was tested), the bootloader enables
> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> 1 is unused) and the clocks for a serial IP (unused by Linux).
> 
> Testing was done on the RZ/G3S SMARC Carrier II board.

Do you think that other boards would also benefit from this change? If
so, what do you think about putting the call to register_pm_notifier()
inside an __init block in clk.c so that this same change doesn't have to
be implemented across various clk drivers?

Alternatively, if this is board specific, could this be fixed in the
boot loader so that the clock that's not used by Linus is properly shut
down on resume?

I'm not the subsystem maintainer, so I'm not asking you to make any of
these changes.

Brian

