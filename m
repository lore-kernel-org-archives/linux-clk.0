Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D273428DB56
	for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768082950; cv=none; b=mpaq4U/WcH5ZklGoiZbwiriE69MhO4n+4JcIAamT+0/voU/cNq7VdiI1qLX2mVZ3mPiGQga6fwlXRKE4ADlejVOE7BVh8V3Xw1CwiCe5AqfiNkG5NpiJuObYgT+AaKryzBO4zW0GWxH/kD54zTQnz7cmv0kyUJPqzo1ZYyY9lLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768082950; c=relaxed/simple;
	bh=eMAwqgYdzBAxFlWVE3o0bvOrDYiX//on6ARzmgYSZGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoUrVceTN7rkgo1CTlWxcBzPvmBW3f0z4D1uyTjShQtJ2gVwrhbPt/+qFvDlluyFVgMD2R39dPuvH+/8bjtHpUnHraZFAwuhxqO19W4jDJMhaZyZZkpvGgduh6IPTBX3XJ2DdPF+4C540zmTRN3OVExePmAjytneVFj2sZh3a48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=kFNEuxbq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kFNEuxbq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a09757004cso49701965ad.3
        for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 14:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768082948; x=1768687748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjgSj6a3kunrFN67IT5JMHaUrlt+PXfCgDXfeu5dl9k=;
        b=kFNEuxbqBC3Q23eWc4kL2qsvGObAMpVanHzsnqjRUIp2Trsyg0lhDZWwZYSDbgKFAX
         CefOxCIqk7Es9wDpCua0nI1L9Gg/J7JBBMjnzO7Yp4j4SPXgF4yorQu8paU7a+DvS1OE
         1SeTnYWe0xZvpBbw80wG1Bx1/UQ1VlTWGYe6dw1Llcl8Qzzib21tDpvcvsfozz2Xga9I
         Y04eD7WV8PLqhxHTrX2N+u//Lr578v7k2KhE5bVRTnoUffiEK0JyUHsWFMxUTFJ0JLbk
         l2t7sA/7ALtcvewZH6hRBCW8wKco2HbG5bDZt3L9doyoFeRtUTZu0dZ94/tsOwD6fLJl
         wbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768082948; x=1768687748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjgSj6a3kunrFN67IT5JMHaUrlt+PXfCgDXfeu5dl9k=;
        b=N1ztvAgKJ35xqES2Q0JIbRevs3usrbtyCKInk3f3MUrUA7iUawImBAs2NTXgSScj01
         chVeQ006mD7ivxfVU68UR9HpPJXYsoVboKi+wRbHynfnPy/wJss3Jr8UfafIVv2d7Puc
         vR4Otyta3gGAvkNd7csQ0xrHyWT6A5KJLgAfHO9rhZCnK0wNYRW5KWZeUzQmH+w5K7O1
         jSn7rImG4A4rQTrvTT0ofzjthIkVjI/1Z/UijNU7SUFHXc/s/D63xINtwS4HwsX/ECMl
         0ner5JWs2c7vJ7hI5DxphWQJuuOPmbmREpT1CQ/q0gq+7Ng2AgphEt3XK2KkHFxsZm7F
         Pj4w==
X-Forwarded-Encrypted: i=1; AJvYcCWoVjlUJi4LEXc+24fMPxY+8zCvQGG8iMkyH4KZAOUQSihzGxBI+VLPiGLseQv0UpGDQAih0SH1zOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywksr6N2/oS9OZCYbru2K7a4zYv1Z7v2IoDW4cZqgXkkKVwNU9D
	mTUEZzTbBqrsVIC3eGjJYKKrGhv0C7UQQWNIf1wlojTLHEop/snzd/cw4aXAGYNtAzMFuO7sxaq
	h+BuMjQG7BGuFVPdnkoNuegg5yPZooZc=
X-Gm-Gg: AY/fxX4jvLeUjI+MRcC18Ibowd/8WXko25DeUnbMh14aN2eWtcRFrq4It+zf+vvekPh
	3NZJpNR9NZYadOtlZW5SG/8LtNSWzoEd+aoj7sd+4Yh2EDR/Ozj2L7aKi/Eda/1Hyy0cJAwwct6
	xbXJw71C23zbgWfXtD2LVCqQEBrzdpHu0459ley67FoVqjDQTsLeFzddF7DeOfZvre1Jt0agFAg
	g0lwRyv0mAr4OU+W4Vosgh3gjw9g+GXZC+od6zBAPMJY2640moOfVhqpWMK3WhOC5ep1ZUf8DuV
	CX/8g+I/VPspQusJcnpTw2LdSdaKgWgaNZWj++s=
X-Google-Smtp-Source: AGHT+IEAqhyKZ4Zb9mGUXaf4V+H313p3cDSNfGR8K+R50WWW/gF491i/LIbVtoG+64AdUYGn/0TAd6Uaqs+FGGXp2Yc=
X-Received: by 2002:a17:902:e78b:b0:295:6122:5c42 with SMTP id
 d9443c01a7336-2a3ee43da5cmr117317715ad.24.1768082948085; Sat, 10 Jan 2026
 14:09:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com> <20260108-a5-clk-v5-6-9a69fc1ef00a@amlogic.com>
In-Reply-To: <20260108-a5-clk-v5-6-9a69fc1ef00a@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Jan 2026 23:08:57 +0100
X-Gm-Features: AZwV_QhAKgfsFN9tGWs1QKxT7kBr72Z-TUCf9Thx-La55n8xXLTiY8eWe0kVLVk
Message-ID: <CAFBinCCPsaywQuePJ_bxMby0MJeh2ohkXcduRy=yxr8EExJ9nw@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] arm64: dts: amlogic: A5: Add scmi-clk node
To: chuan.liu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for your patch!

On Thu, Jan 8, 2026 at 7:08=E2=80=AFAM Chuan Liu via B4 Relay
<devnull+chuan.liu.amlogic.com@kernel.org> wrote:
[...]
> +       firmware {
> +               scmi {
> +                       compatible =3D "arm,scmi-smc";
> +                       arm,smc-id =3D <0x820000C1>;
Just before your v5 Neil merged a patch to use lowercase hex consistently: =
[0]
Please update this here as well.


Thank you!
Martin


[0] https://git.kernel.org/amlogic/c/7bcbedd64ecf5624583140faebfdb0e2e2f6b4=
3e
