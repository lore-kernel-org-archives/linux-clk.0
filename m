Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B6E1DF74F
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777052742; cv=pass; b=WBx9YrmXCjw/6mKUhP7qAiAxewLZUl3XKiRP7n00Zs1YDK6AVrcVO7wE1HMS8hxPhQKVTXrODiw4h7WVVWBpdQbty6LIpJV3a/QJ/yzJb6L6NOy/sLQ3XPjDrq/496am6KmgsyK/2UM9ldRHyAwaxU0Fp85nXRbSNS8F2GmKsIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777052742; c=relaxed/simple;
	bh=lBO+8IWkOvmjF/T33XnJITsxmwW3WOXDRY40g24a8T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XymeocrDPCNhokcGOrxcYCMfazZYyx/svCPgNEFhYaXNnanuHAPae1MVQZqLyld1sO1VNZE5hFCWrpwM2KWs5zCMLqw4t2QFIZ0e+CxDodu5dVWH+qalytYCpoNyUlIWM3foauYRYsTltDMem0/3lf0WkOPRRwmllzo6bEQuoro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jFzjDblt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p5OwjO+O; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jFzjDblt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p5OwjO+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777052739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBO+8IWkOvmjF/T33XnJITsxmwW3WOXDRY40g24a8T8=;
	b=jFzjDblt/h7jts2YQ0n6B8g/pvLJf76y/RCVajDozX4yxIQM30aIriwsP4peLxdYmkIx/T
	epj94TGWidI4oeZpggSf2gWYuiRMXThvy7Sfvjwx59sRNBdzgnOc5IOUGP+YMQCMslIi9c
	b5Eq+EN8hDq2nnSsGSWbfG8RFAKMn6w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-V3EdcOE5PH-UnxzBpUmzHg-1; Fri, 24 Apr 2026 13:45:37 -0400
X-MC-Unique: V3EdcOE5PH-UnxzBpUmzHg-1
X-Mimecast-MFC-AGG-ID: V3EdcOE5PH-UnxzBpUmzHg_1777052735
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b9417a552d0so294240366b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 10:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777052735; cv=none;
        d=google.com; s=arc-20240605;
        b=h6mBGgMloFi6yZbKrkzYqlxy4De9CfNoMGCX8BJaZsewC4oxVlURqqMjWIRwljxkEf
         hztMyYvoYiSAHB7VVvP74tip76Rg4VhFW3kyKY12m06B/28WEDh0ZJyooV2zIktkM2f7
         lMaD6tksR6ERQl5l+MnwBS3msxnZ5b6R0grpjl4sEpOYWtgYHd7k75Ir4g7uJKyNTqpx
         ZbHbDa5wHWTxk6hmZKSdBrGq21a06+SHyuv99zQu166SMCLs5xWkrYIk94a+MYjgxt1z
         eUCa2myq/a1WESMcMO6ampAUAtGPoiWeOV8KhQTbFlOf4lKv/2vN087gbni2PAu/Kg7S
         NWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBO+8IWkOvmjF/T33XnJITsxmwW3WOXDRY40g24a8T8=;
        fh=HlFLN4CU2iUIiVaVWco7cUHCDqdL1XyLsuDWXUCJgCA=;
        b=QsjuYEn+62izcgSlDEI/9947kth+L5/yLLDN1pa3cItixnswJb4ewRFu6yZXK99DGp
         GFhmi1ApQqzMynAvwEECxNLievni3R4cHRYA2la520zwaUaemAMwokp+MwArCouvQJcE
         dW49zU5X9sJNK4NaO5iKmuWQuvWFPROVjzyDkTFZaLVxDtRdUibN26fGRlY3ZkNXazQj
         KkycJW+vu1NiyJJ+od/B4d4EgxqR7/kjNBzXRNIJtT6S/9OfjLdSnwUTyDAkB0F9Sznq
         RuYoa1CLOh/mWdTkPmt47//QXDjnrchUyrkKkGvxbcWD2kDp+A0caUcYZJ2b3/F2Wn9b
         kaKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777052735; x=1777657535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBO+8IWkOvmjF/T33XnJITsxmwW3WOXDRY40g24a8T8=;
        b=p5OwjO+ObTdChTn79OKnB2XMwVAQadPu9wZsui81YJV86pum6JazG9ptY2aDUTqQJx
         dtLtzaLOSW+RDVXhU/3omYzZFVSUVYfRXIpVY6NdrfW/DMTAgCtb8fXc0F5ne9wi45qm
         bTl92+hcMvRDsG8Y0iQLs3Q/6MShijaLxX7+1pQqvsu0PoLFe4t16plPMdzgy5n9Sxzz
         xyiXvJAVl/JtHYivWOLdrs90x0xxC6UwMGliqe5tWPJm5A5VbbMvSqcsE8fs/u7M7zEp
         HEEh1NiKcBJs8DnPg0/GPS+70ImbbftHkbeDM/pl6kh4bwc7teddV6H55EJpas7JaF+Y
         B0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777052735; x=1777657535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBO+8IWkOvmjF/T33XnJITsxmwW3WOXDRY40g24a8T8=;
        b=KAv6wdKsvpvLIsNSPQl2HWwHxOcJwVjZISfKe4CZA43xz3VuweHPVKbCKWpV9KnmlX
         8beY2EP4ki0k+D/+H8EDmDjWsr1x1ogjdeaFu8lSabXRo/9U1pbCjhFjouNhPNF9r77O
         mscx/eW5eRtnMCwnCoZn7af7QPGopfj8rDXIQxiy3IhlQlr/6YLTPZRHd6rAGwj9YmTu
         FLyvitpTUKkfj2SiD3QSSWmDj3cAIflgQ8/2FpQEx3YZWUf/Ki0yF7Eg1KfmKyaFXA9F
         boOdx2u0AoeTHHA9LX75LwAGgljWYJVlREyU3Xu0RP3Afk4yxyzlDX2fzs1EODK6fTso
         btJg==
X-Forwarded-Encrypted: i=1; AFNElJ/D/OrTKtcpYvr1JgPNVOW1cOtZM+5EzX0qfd63ZSeRTim77bo4Wd0joHjB1yF72Wr85xexWl9YE48=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDEHdgofKEryGA6LE+sudJWY6pERBt5HxaPbpvqu7voog80NX5
	EDELgVpYSk5sM7QlpK2C5Ckp2n9spKVhB/rP90UUADH3GZKaUC4CehXsj9g6CSyHdW8a0sIw2qh
	7aEV/1Ap1Kl81/kw0HTwTH13n4n5hw893wgjiC0RgdBSv2VPH0Y2mXcqtMFqNUdwVyWG58k3hGX
	wmEcyFdKLnmsnkZk1Bo7Mkrkj2H4i2Ycpnn6vU
X-Gm-Gg: AeBDietJI5akifIQRltMjyJt8yL2AJjZZKu5eh/fhlDcTzWstnLIMlw7PTr6/c+m6yd
	fWEhuz3ld+ldLGwvN6IvWR8NHB6nYCzKCq44T5WpFXZSjuCijcto0pGj0adZHKBxJqtkr2cjlp6
	zMw57+AZYcZZZZhQ4fJOsKLxJ09gpXyUpVCfX5JSbZNqs4Kcs7LJzLSBd3KhH6Do8T5nZ6FxOoq
	uCQGQlhQOL+Xws2
X-Received: by 2002:a17:907:3f12:b0:ba7:f5fd:ede0 with SMTP id a640c23a62f3a-ba7f5fdf234mr1199006566b.6.1777052735333;
        Fri, 24 Apr 2026 10:45:35 -0700 (PDT)
X-Received: by 2002:a17:907:3f12:b0:ba7:f5fd:ede0 with SMTP id
 a640c23a62f3a-ba7f5fdf234mr1199004066b.6.1777052734793; Fri, 24 Apr 2026
 10:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
In-Reply-To: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 24 Apr 2026 13:45:23 -0400
X-Gm-Features: AQROBzDecVKqp3-2I5CdQ01F9dTmpiznpdnxhUyA0LuMXG2eXkUSRX6qFY8D1FY
Message-ID: <CABx5tqJQtgAWboRYR8VLmzUUZn297c7sz7YmJB=uKaAY7iw=mw@mail.gmail.com>
Subject: Re: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 11:37=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
> From: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
> display driver, which remains active until the vc4 driver loads and
> sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
> lockup happens and the firmware becomes unresponsive, causing a complete
> system lockup.
>
> Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
> clock disablement and remains available until the vc4 driver takes over
> display management.
>
> Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepa=
re callbacks")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/5f0bec08-f458-4fba-8bf3-06817a100c4c@si=
rena.org.uk
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Link: https://patch.msgid.link/20260401111416.562279-2-mcanal@igalia.com
> Tested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Brian Masney <bmasney@redhat.com> # Active contributor to clk

I agree that this would be great to go in direct if possible.

