Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B493233C502
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435660; cv=none; b=pi1u7lnifWmCZLH3QzSukrw3rlulb85ELtHNcD06rJSBgNG/n6WLTqhufCWVZySUEKMqkrfBNZEsGc96qpOm03iK2VZ2xseBO5HkVgrHn055ep4kcG/H6eH1pGHXhZQImC7xlumYfYpFYT9edL4NUp23Qb6ZGxyd/5uU7B5fmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435660; c=relaxed/simple;
	bh=XJf7mRPvEPWUYW+MYI8B+jzBAKagZwBRyuHNwT7cJvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VURuzQkt3Bobc+QJsgfBykkVm/Ei45RzJQpJxtxWNBKAR2mpHEdGTjOldUQFcJxGiazMAQLo6NJRm7Bt8OGbJw62S2N2VG4C29Rg4ehQA6+uUoOSbKay84nAnc3B2yvw9maArd97We838lEW4ODVMg6AgyppK69rt9wx42tBFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hr1CDr20; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FudVlUUG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hr1CDr20";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FudVlUUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ph7EonUkISD+ckd5Ulg8eFLpvpFj+V9UnIoIMQ3RmAQ=;
	b=hr1CDr20ezLQzf8cDjaUbbBJNedjoVWrpPfoqXNrq0Zc4RoYuzXsULHE8WiyCs0STBerq2
	gZczMgG39HmwGYxTFrjEHszMlMMbuMVkLluzwdOkEaTh3QtgTERoM5fVhFKLQpu9cKFv+5
	CbxqgMccxmC8VopehxTjT88TtaAiBtc=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-d2UJQsHmOhiKG1sDHcfGSA-1; Tue, 07 Jul 2026 10:47:36 -0400
X-MC-Unique: d2UJQsHmOhiKG1sDHcfGSA-1
X-Mimecast-MFC-AGG-ID: d2UJQsHmOhiKG1sDHcfGSA_1783435655
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ea80623bfcso1897401a34.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783435655; x=1784040455; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph7EonUkISD+ckd5Ulg8eFLpvpFj+V9UnIoIMQ3RmAQ=;
        b=FudVlUUG893Ze/8MmwXeU85eKZzoAAOGfBfYCHq3dwTiwiFkKzyGG9P8NXGxINVxo3
         Hp/TbkPTQUWCJ6w9f89+WC8YlWii30xY/te2wlw/zm3UtCkZd0MXwFTLi8sYosw56TEb
         kdtsrLgj9sE4zuQsN9N7UqwzjEr6nAEs2/XlTlHIFJUnSeFkn6Iyi3AMmNKwtjKFaVeH
         4gs0mYBrUgTZs7b0Oz1huFh7hIWw930wpmFMDMcwnZ4oTk+b6E23TFxenQuXW1iPVrx5
         xEX4h9LqzjcjA5f+H0AyIEaXPWKUA6w9X1WVZ2bugIzRMbrwS4W2qntlj0Lk4bDBnOOM
         2Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435655; x=1784040455;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ph7EonUkISD+ckd5Ulg8eFLpvpFj+V9UnIoIMQ3RmAQ=;
        b=gpFnyVnLspyK/WMr3Y/qypTl8FvexDtEUhUaQoLWz9S9F2MARY+GdicqkVfdthTrCJ
         l9e6usl0WETiLZhrnoHoMrAPDlljOkW8GhlC8XPn2on1hE/lPpTRsiuhg5fJELhdNm3o
         VvNr7mHl/JeIs+fEhALb48DDMMeWCxa6e6Jw6ZeUebn3oiy/hN5M1MykM8Qu6i1A6342
         gTXwQUycz3p34rqcR60dsfbVyPchfqY1+LG6cZJ7ys1mesV0mcauOBwWUiELa9kDcR4o
         XrA1YRJySXOGu+iBm9Hk0Opob56oUlL0ZIXSd3c10FbjFvh6fwo1oRxrEoKXrq8FXbzm
         i6Ng==
X-Forwarded-Encrypted: i=1; AFNElJ+CyZznvi/HWu9i0wwIocVh47b8Y1B9rWdxgGRD7e7GWdKBbF39kILe3l0/S0iEYWYUAJ423YT1Yb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtdAwRLIWTTgQBCr0BMdbxW628M7cEH71SlHk27q4wTpG0XXz2
	ho0ogbz3YSbCg05SdPIN0OnYacPWniBoZl+t37aWBOVMmjuNs40QyUsQiBGX+pclxK38QA8E9zr
	1zH+4Tp3By4j0P4QIJ003fX9iHAg8VL6/39pbZbM+ILUkD+o+yt1PC4F9oNJITw==
X-Gm-Gg: AfdE7cnIrAvm6A26KbN4tTHmoDax+8T0hW5Ll5bit7iR2oYzJXrT/dXbXkZHkl/3KIH
	fqamZgc7op/UIzSrkIQwBV5tE5WEEMDw3M/42tLRWjUSl/uhOXEKlytVBQH8K2j2Zcmof6HYbO6
	6k8uLKfg67dNEnO7KSC3rV97UuOdm9ZxDzdGWOjrZnIRjmLK7JIST2C7OUZmv0PkObrgoIzoZVI
	W5jAk87y+3rR4Gr0Ko8rgmlQ1CHFj9hJF/pK4wGrubIMAmrV4UgM39Yq2MylCii9GHtCQu5kgVH
	Qw+iud/C6LrxFL7O5HbkrQkkX15lfPmZ1PADMhTIbWcpKxMZ+hFFuzFLqYapHz4747vZPGyfB1f
	7+Dg9J1X1
X-Received: by 2002:a05:6820:a09:b0:6a3:2b61:4cc7 with SMTP id 006d021491bc7-6a355597cdbmr3682117eaf.72.1783435654812;
        Tue, 07 Jul 2026 07:47:34 -0700 (PDT)
X-Received: by 2002:a05:6820:a09:b0:6a3:2b61:4cc7 with SMTP id 006d021491bc7-6a355597cdbmr3682007eaf.72.1783435651367;
        Tue, 07 Jul 2026 07:47:31 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb54f775sm13945468fac.10.2026.07.07.07.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:29 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:47:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: mediatek: mt6795: fix memory leak on module
 removal
Message-ID: <ak0RfpOX-KTT5IZt@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-3-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707074839.240676-3-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jul 07, 2026 at 04:48:31PM +0900, Akari Tsuyukusa wrote:
> clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg.c
> do not call platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL, which leads to
> calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

