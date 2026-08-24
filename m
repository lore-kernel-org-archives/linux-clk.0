Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA823643F
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584523; cv=none; b=FfYvq6O02RwTFQuw2cR4i7+k6tjOncnDF6mcHjiOR5snRT5hMyPXbYGeFT/WTpTzSgzM9r8Bfw8AeBYbTkJVhbNJNgNSAFQLASxq8GzPqkKSdZX3DjYVaFQJ46ippLSWRQ/e7MYNvG+6uWHHHZ1/iJ5doqgOu3p0Nab9rfO30Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584523; c=relaxed/simple;
	bh=qK1GwUEcsGrPCSm9TsEBc8oiljPcoxu8605ddv2YQNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLs8NpIDWpv08Ok95IHJ6jMlwQrETJxAKt8qKQ8P7V81gjJiSzxN9mc2fpAfFavb61jQrpv3REaDhbIeOZpPaxKq/oXnd+pGSlNWAkxrWb5GoTkREEnfWAs5pXo/jROg24DH+KYc0aNAe4lmWH3mHmfgbks/mW2aNQWVD99zWI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3r3oEsJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rk8tUfzA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3r3oEsJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rk8tUfzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/hQ/sSTFs5xLRC8XTkDORGtcjc0aCfdkhYo3Pbbm9UI=;
	b=A3r3oEsJp2anXKMkSqQlVJUS0Eo6wFCIamz6h2C0neksO3xhZohiinKYcqCH/qZ72PK5CT
	BLWRaZKM6agv4QZmNoIAp76OBSoPHubT7jkP14SngkpVJK6tnwdAoAFrQtYi4405D1hQyt
	AcaSbSaVfY2qZTDwDiMD3LPM4BlSMzE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-86BXqkqbNN2XzC4QvMLW4g-1; Mon, 24 Aug 2026 11:15:18 -0400
X-MC-Unique: 86BXqkqbNN2XzC4QvMLW4g-1
X-Mimecast-MFC-AGG-ID: 86BXqkqbNN2XzC4QvMLW4g_1787584517
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so386886185a.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584517; x=1788189317; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/hQ/sSTFs5xLRC8XTkDORGtcjc0aCfdkhYo3Pbbm9UI=;
        b=rk8tUfzAdkry9Zrf8HgdlN3NHCFhhA8aMvyWWF7lpzX7tefwbjZxuoPGaABcfgu9Lr
         UyH7bVA/5O6jkNfcmmTheyGpcz92xoFoIhZAROAM4+MXJTuhs0MbLqKBfc8HrgiNGr7Q
         KGIfel0AFnR7F9DunaGh+34ZWU4n9uyhhNTeyg+HGUFWcS8Qsjh/nNBoLjyZUvILJluq
         gLh7dUwD7+H82m+laVBlNmAaYwTlWh2boEf6bkpDjLo02biWUfynrPJMSOX2skZeY+rl
         Dg1snmD3W5iJd+6FiOBggGXotAbInOIs4evKN/aBlQOJ+X30ccBLwN5yK7t4tNmXd8TY
         tm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584517; x=1788189317;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hQ/sSTFs5xLRC8XTkDORGtcjc0aCfdkhYo3Pbbm9UI=;
        b=LkqXZ0YAYq/zfI2FMMR3B4gzbkQ//wQZSxwXnDQXzln+rk08qyt1oJRqi2oEp6pWoY
         tZRqjiCxUbncv4EuSVv5vZTMA6+cKLmJF1YhC8C2/9yYpJ20Jt5B35CjeO9uwZU6faI4
         gsMQhMp8dAfOFTXhfGga0VeNXE2kJYB2hqNkaM5n7x6+JH1lNuUj3v61dVkTn3Fpfuqs
         Hqb5x4uDLc93EvbWYC/cH0uWw+OyFtNXl6s0pt5tJwVOhnE5DY6u5OymoWBuqbGk4IIR
         sS+yuolmVB0pNILFzDCmSVDWwpG32su8oMPzp1zhO5GUI0yJVtoMzU+xarq6JfrXFAIU
         JBng==
X-Forwarded-Encrypted: i=1; AHgh+RpeBKpfWCWWj60o6bBN6PJsSqX/M8TGy31VBukGeEzDfw8NfUsgy+AOMsc5sUzoVwU1xaUEwvaLxy8=@vger.kernel.org
X-Gm-Message-State: AFuF++lejOBr2TdDopG8nKgK4OCAsZ+MbvmyzqJuIT7Ztch1k5fEKWjT
	b+hvu59+QRi6UHFjfwpQEu5gnsGEznJ6YEAlDD0ml1zuJlXkl7Qcfk+w78w+GNU7scnq7zT1OkZ
	b2PJ6gvm4FbevlaukTkACzzrQhbNbZfdjQGYH2y6xRKhB93EA0ophGj0j2Dbfxw==
X-Gm-Gg: AR+sD13KgCS4bH+TE1mtx+3RDe2ZgZMyQMOjc62WCRRwnQNGX6fqnoZbeTbQjcQjA5P
	ENnshmaEsfnfxKznvdnYNRfvX6diEIBOt8HpgtihWGBLUc6N95jOMwLnpNq9OzPdy4Iib8rYMNx
	uuPPy2mSWzsimZ77iug2LCjrXLBB1fjdhgWxloH7lF8A4dpSpaM/+VRafT+PJAmRHlEblSiSVsO
	pqAQoaQeMHfn0cW/nUUBbWaGIkpaFIv8OP3jJXBGGzaJni5K0K2M6PtirHvh8WgNOEjCsYTQnzH
	xTJhH9IsYPXh9LQCe4ECT36znV/8hrYiFOlU+kBdgLI4JLccuWIwHYm9bet+xj4LFooHZ0dTvPM
	f4k0eacSGyDad6KcEk/LCVTgjb937WEnFSuY=
X-Received: by 2002:a05:620a:a28b:20b0:936:9f47:e908 with SMTP id af79cd13be357-937394a1bcdmr1968165185a.19.1787584517479;
        Mon, 24 Aug 2026 08:15:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a28b:20b0:936:9f47:e908 with SMTP id af79cd13be357-937394a1bcdmr1968158285a.19.1787584517040;
        Mon, 24 Aug 2026 08:15:17 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abec47sm517147585a.1.2026.08.24.08.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:16 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: codecs: wcd934x: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxgA4ty6zhxEwIZ@redhat.com>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 10:52:56AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

