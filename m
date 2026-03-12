Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67D82C3261
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321010; cv=pass; b=jZ+8FjFLqBHJHu0r478BDBOVDNpZGeamKFa+XKUaLqfRHPIUFP5aRX6zhBlPxzLPIoLfJbwP6tGFss0EZ1eLcCv4b1KIx+7EMBDRhkGwNJnCKmVco+3l1B/hdFqGX7a+pRjuTscDvpK2G4qd2M+uGKkT3aU/TyaVFpCPPg3e3A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321010; c=relaxed/simple;
	bh=50UvOR1IHtWPSY6S6Ia1l7TpQd3bLQggsAyfX8n4b3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEwDGSVJkLf2RsoVHnLEE+Y7Rn8sPke6zYT7tkYXi2lDsswGdr99NhsXxwfUcJuu4/yE4SCWbbYSJW1MzHpeiUUC5hqn6e27GNjCbwGtmiy1A1NzL2jLIHKiwCYvfqXBu3XL9cX8lxUzyBp96m0/B6z9Q/0nBmLKK19yM0k3/4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WDDVDD/l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aqgtkRzW; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WDDVDD/l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aqgtkRzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773321008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuf0Eu96bBgudTQzSN18n8Y5T9mDJgQ4jlP8CRmkulk=;
	b=WDDVDD/lGwZhypsiP1l9UuxF+hIV9m8eEqsj1wx7qvpiQ/ME7ZHcwgpqJAWWW9DLUjgEMg
	Nl+MzKm2vyGsziO+T+byv/YFA/Zk2UPB5p+l1zrVYpuf5KK4JFT5eaQKv6M6xzZ22SNzlk
	YECsZAQXqrs7hpdVU0XcEOqFU8i5dmY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-yNJQF6OrOouqJa56hNE3xQ-1; Thu, 12 Mar 2026 09:10:06 -0400
X-MC-Unique: yNJQF6OrOouqJa56hNE3xQ-1
X-Mimecast-MFC-AGG-ID: yNJQF6OrOouqJa56hNE3xQ_1773321005
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b94a16b575cso94719766b.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 06:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773321005; cv=none;
        d=google.com; s=arc-20240605;
        b=hKrXbaBi1pY9yeuX9MdVQBfAFlsc0UJ2BOUf/Q9Kpd71ynZDCmjVOX6N7ChvNM3Ndk
         i0QfwiOwLZKxi8DTtwi8kjhiuIs+BjB8bW33EYBxy5UQDA4N0WYl8dm7VwJ3DxjNHRB0
         j7dNfKLtnxAUSubnCXifMZQOLZxbJM2WeBtg73aVNcKSnTwTIhLWGvYtUjSfrxZAHC77
         RrTF/N98LH58LGg4LEF4AnhznzSPQI6II1dEz6FyHjBgbRjhNgLD+e4OykTxysUliQZg
         Myn5U0OMtVxDtD3hxhM29aB7Cdfz0/bSS6Sdlf+i4ZThxjBzLwcAoFHXwRJzsHLOna32
         vMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kuf0Eu96bBgudTQzSN18n8Y5T9mDJgQ4jlP8CRmkulk=;
        fh=histFZijuBd0iAjqsgnJvv+BAhNBBKUMrERju/R3fus=;
        b=QJyha9JfMfXNlVDNf+IP3wXrbF4fZWrvO9boMJPidqLVPDz74m1gCYE4DN7Lcox1o1
         /Sc8o4EhedZpqHubI+4zeUSyNAlyjyRdXSaBNFCaJB/tHUaQprmiEDFtC9fEXUGEKsFd
         M9S61pVe5NRodgEcT5x6VOyFl5a04FsjaVJoc3VjoUO1HPvOLmAUhjrt1hRqKrFB4usf
         twYOAwwuS3ID3BoSM87DdjHi+6waAnNp3PX8nfKiy7Il2ZKSSe+zxpT+faj7pwkGDNrf
         9jUpPvAW5IucftVhIDQpGKbrW8rRukKDeW6QVZ6D9kTRdqWtAHienAZCqHiX5GRYqHfX
         Oczw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773321005; x=1773925805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuf0Eu96bBgudTQzSN18n8Y5T9mDJgQ4jlP8CRmkulk=;
        b=aqgtkRzWG7iOUqJKDZv3XlhKFkIcd5dFJkQXyEUDomcYtVvzI1f648P3usaVX/U4sV
         MGR4Vgm2tSPP5H+1JSkQDPhcYu2S34XJvMQnLqAsgRIISFxsPzszMO6E6Ts7LAPp1sSB
         tdDIaT6O5LdRzCt+Gj0yYvwFXPxGUn3tyXDUjHQTPDDhFQXFzpnFk+aHX00um2mCq5gp
         TzZQwFFIU4KBF+KuujNj264bhcNEw3FqE9vtso3GN0iEgo3J+VGAXoNFvEvzZXsg2TUB
         2FugZnrmV2LaNt2gIWtsV8GNM8lHlAx4uSr96l8upgAbj2aM+01N4j3HGJypMzW3IrYs
         O/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321005; x=1773925805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kuf0Eu96bBgudTQzSN18n8Y5T9mDJgQ4jlP8CRmkulk=;
        b=POQgIOjaMGSRBvNu/9a5KOwgmmTw6ab4ciUvtjKIcrOfPSbSMm0T//TS+Q7bC+Dca6
         yK0NQAoPD0UOu2yAPVa/0U424/0MGmnQq7GQWC7y231Aey7wPfwT7DGCIAIKcduVJqjB
         Pla91ypYavpU47yU5ZhyEQBO6UhqcGndzI/QAR62A0Ts/bdjfBkfLwrFBJHeW+dljG+A
         l8MdUpZWwi6f1VBIV8ndISadF7Y6WodK18zb8h6XENrrPDpW9iPbqz/ICxCB6aSzjUyF
         7LKL1XzKyKWNhNeCJ/nWO553rifqGhXLIuluoXBKDcQpzwp5LYPzu2qqRHJeufapfVwq
         Alkw==
X-Gm-Message-State: AOJu0YyNPZPaAqQXxf7Mkkeg+PulDiIc525JCvnL6s+H3uN8LaZbHVl6
	Jewo4cIyGTUDa3ZltFyV9smiSMyEG3tOGnL8o/lqfVstAzZ/nKeMI0z3oMTpRgR37h3ZWouF+TT
	jqE+UsnsEzO9NX6ubbqmluWQCex5vDsxTsxXK+BLk6rRVEkoqFzJCLojL6TqdAyggeU/wfabZCh
	aiNSzyfsbwXaCTB56NDsCp2OpVnkVMh1ILDplp
X-Gm-Gg: ATEYQzw/m1Tjc9Ip0esv+VSFXMGrczmsamvI/J2Crib+uIQvzJWsKnwSvif02W02RAO
	+lw3vEXXYGSq8PLRoqsBFSeioEYNd/Wa0XfOxadrfKDlgg3UrAmlg27z+dYt6DvU16/QBVrxc2t
	GRDPoLc6+VNWLdw/L+MB0yadWFM59hY4qQfP/MUlAC7fdBeGCIIPQtAN6Nbi+N05KsS7p/al0LW
	XMNGQ==
X-Received: by 2002:a17:907:25c5:b0:b73:4d06:bc8 with SMTP id a640c23a62f3a-b972e5d7528mr300950066b.53.1773321005153;
        Thu, 12 Mar 2026 06:10:05 -0700 (PDT)
X-Received: by 2002:a17:907:25c5:b0:b73:4d06:bc8 with SMTP id
 a640c23a62f3a-b972e5d7528mr300947466b.53.1773321004471; Thu, 12 Mar 2026
 06:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
In-Reply-To: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 12 Mar 2026 09:09:52 -0400
X-Gm-Features: AaiRm53YGBUfZJ_KQ35Vo3CT7DBsVMfH3yo2uKwHeMLi8JxR5gg8cMQt91_LRJo
Message-ID: <CABx5tqLy0HSG-hd6sL-LUJAstypfzv=HhP_ptGsOJpr=OrosJg@mail.gmail.com>
Subject: Re: [PATCH RFC v5 0/4] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 6:22=E2=80=AFPM Brian Masney <bmasney@redhat.com> wr=
ote:
> The Common Clock Framework is expected to keep a clock=E2=80=99s rate sta=
ble
> after setting a new rate with:
>
>     clk_set_rate(clk, NEW_RATE);
>
> Clock consumers do not know about the clock hierarchy, sibling clocks,
> or the type of clocks involved. However, several longstanding issues
> affect how rate changes propagate through the clock tree when
> CLK_SET_RATE_PARENT is involved, and the parent's clock rate is changed:
>
> - A clock in some cases can unknowingly change a sibling clock's rate.
>   More details about this particular case are documented at:
>   https://lore.kernel.org/linux-clk/20250528-clk-wip-v2-v2-2-0d2c2f220442=
@redhat.com/
>
> - No negotiation is done with the sibling clocks, so an inappropriate
>   or less than ideal parent rate can be selected.
>
> A selection of some real world examples of where this shows up is at
> [1]. DRM needs to run at precise clock rates, and this issue shows up
> there, however will also show up in other subsystems that require
> precise clock rates, such as sound.
>
> This series introduces kunit tests to illustrate the current behavior in
> the clk core. As discussed at Linux Plumbers Conference 2025 in Tokyo
> [2], it was suggested to move the negotiation logic into the clk
> providers themselves so that only the clks with this issue can have
> their rate preserved, and add some common helpers to the clk core.
>
> Note I am marking this series as a RFC because:
>
> - I only have kunit tests, and there's no actual real users of these
>   new helpers. (kunit doesn't count.) I'm hoping to get feedback from
>   Stephen if this is what he had in mind for an acceptable solution
>   based on earlier discussions. In the mean time, I'll see if I can
>   get a board that has this issue, or work with someone in another
>   company that can test this for me.
>
> - I feel like the names of some of these newly-introduced members
>   could be improved. Naming things can be hard.

I came up with an idea to simplify this patch set even more, so folks
can skip reviewing this version. I'll post a new even more simplified
version next week hopefully.

Brian

