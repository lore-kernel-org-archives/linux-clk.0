Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F2A3A2E33
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174497; cv=none; b=g/nVvqV66AfssgigCuyFlofMKr9Fybi/yVCjVkXp1m9/a7EFGSpRqz78eUuNO0b15n7llMYdsUNWIsmMLgsIhlTob08M/svMgEF/3uEcq85BGBNxrf1WiIUU84N23hDUyUrfsFsLmwWTxv6WWt11+Ehn4PQkVCGle1EuMxwQAEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174497; c=relaxed/simple;
	bh=iHrHqCAXnU6w0OS7DQt+y8wUDDdgUtnC3rGRDaExFLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDoINHRIiIddt2TJB9OEZdRCVk1buYH3DgSHiJB/hoBgTSe47uNtKrdmVwklt9n3jC9yKZVS6qUGZT6GBVMuvkWhSe5EH12/n5Hu1BCXaTgboUsAjp5IIeDYODfmZLj0wv9vNGjJYPaBjg5K6hD4dnT7gwUgWE/VN4Qj9SXHZ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L8dNnuXP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ne0wFQWb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L8dNnuXP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ne0wFQWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVGzn/bp+HeoWhJcAlXzRJysNeFi8GSJbP12rbQe8Y4=;
	b=L8dNnuXP5IhnrE9VWe2vk74YdnSQra+uTMzoiqaOXRBMPqb3g+goaiMrpqYhkcjluyOp8q
	fT8HwA+vdUIb2YG0ji7tcsAUuKaWbdd4CUIsgNASLCiKjs4/imRxuXp/VPIfJlHP9rfXiM
	7D9Tb3x9eZGF1t6xF6I5nLRwNNUnehQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-bIWnAqbUODmLkE7q6yL11w-1; Wed, 19 Aug 2026 17:21:33 -0400
X-MC-Unique: bIWnAqbUODmLkE7q6yL11w-1
X-Mimecast-MFC-AGG-ID: bIWnAqbUODmLkE7q6yL11w_1787174493
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso27007321cf.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174493; x=1787779293; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pVGzn/bp+HeoWhJcAlXzRJysNeFi8GSJbP12rbQe8Y4=;
        b=ne0wFQWbOks4TH9YSYxP+L3J61lBszhuVxir7D11tT2yHDCd0KwAlcruZTgW8M9CV9
         g3GBB99AlbsxTCrTSyNxMC7sq81OK/2j9HBqPFkEA7Cuc+SRoxWIoUe09KFa3ls7cVE9
         P+RNW3OGxVvIgGOlxLVTVZjGjPqu/CjF2fV6aqi9XZl5K+5uhNxFnIQPBYbGY2B2kKnz
         te/VlM8wPJD1u/COrI6v50PsCxFOEnFQNofjPV1yKklmYDspMn9Hcl6exxZ5hi0JajUr
         35pkqk0pvtYoNfc+ZU7Dz6RUMKXY7BLL/zftRRM/J782wUV7/0VArpnb747VybPxt9ra
         HboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174493; x=1787779293;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVGzn/bp+HeoWhJcAlXzRJysNeFi8GSJbP12rbQe8Y4=;
        b=hXKg/h/hG+2PdN4m7lEulsOqC4AyMZK2RL9XX4afAgM0BHPobpMq9cE6lXkJjgsUVU
         w0RXPN0sFDkzYMnNooediTK91X8xFBETIl5R0BemR2itGs1wYnQPws8WiSoZ4HPnbN7M
         lwRTmCYOmHF8bh4YEIHXOCc3GUxvjYKd8Db9QYqOAt0Ma3B3Z0acQ6qEEfoUDsLW+tsm
         H2oZZK22lkC+0Nxna4DImi1Is3qocfC7us00uz0WOfw8YOkN10Lw52sPxveHFZD3rF0W
         R2Rxg7JGSCyMhbg8R/DcIgovEarXOqPW/MZ4MSDvrDjqdeoywQOGBaFdbKweFOy1we24
         GTTQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTkjbCKfBbIJBxWr2f0HbrBMbvJQBO7pm3erFW07bFEKwNtN9VdAK45LbIfW1crmv/CNoZDiHe3yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZSzGRZU9R3kI89lRSCkKOkJAvQVHeA7mhU645upd7NiA3NQq4
	eCajjxxo2i8HJGUP/vDZwxQlSaBN11qqEDAQSsL5KPbBHdESpnjdyZImI0Tl9hNF1U8Atqn0B+F
	IETP6dofL8zJnE/McVKPujHh1TtM1IXh4zuP1iNIiR6GEHh583f7au7Ihy+Yjlw==
X-Gm-Gg: AR+sD13SH3SLbXqZ5jpyX/Fy+/GgN/B4n46LwetVf21gjZsX+ukgPLrTltKQxtz+s8F
	rxFluf3KtoRw7Scs7SZf+QkPa8hYjkyyWvHA8uj/mXHsY+cuO95Aw4TAg++OLS+DnumMIUP6W7p
	y82pU2syPCs1Ag+y/VBd3/r2wHPatt9af2zVbv+ZmAonOeVTrY/ywvHowqREYHU4DMSaQC7fpUQ
	F3mDTlilkCPLSfHADgCRfk6Owi9/EcwLEZyTZMdnrHV/LdfRyQwkCTotvo/Uv5krTEbwIO1b8Wq
	NmEIR3N/rqux+tBNkXHsn3O92q4TcwVQngCMBOfMxIdeL0v9lDTh5H9k+K4GcIzjDJr7kMelkkG
	z8Q24E+nhym+IotrCgJ2PEMcbulqCPDn2tUc=
X-Received: by 2002:ac8:5cd3:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52dd5cf792bmr79425621cf.40.1787174492959;
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52dd5cf792bmr79425061cf.40.1787174492580;
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd8598adcsm18745871cf.9.2026.08.19.14.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:21:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 2/5] clk: visconti: Make sure clk_init_data is
 fully initialized
Message-ID: <aoYeWR6H3q-d3yd3@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 19, 2026 at 09:05:16PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> visconti_clk_register_gate() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: b4cbe606dc3674b2 ("clk: visconti: Add support common clock driver and reset driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

