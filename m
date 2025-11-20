Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549E2DEA7D
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633066; cv=none; b=dR3niQndhhp2N19Cbbl+Y6k2xpoZqn/zmNSHt7ieftxcAzMvHlZ+anScOO2JfujzcrvDnhbo9rvF1MV4GxzrJoI5oFVwN3DomQDkMTk++WgJBWqZM1P1wZ9On//DEbqAYJtJgzumfqQFbLJ5kxVyn0iV+iUcYcj1Vq7fsbzJW3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633066; c=relaxed/simple;
	bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KN0yAgcbi7/vGxAvnKDEAcd2i2JVZq8JfNinpvVzVrA6fEqJ7fFLAAdY4+blJ2ik7Fkyc0aRbGtg4NPKavqcER8gA6I8vCSLWYFQkcBQyHUSKP1x/+2RdDychcV93sSIZYcmNtEhk1XDVnzLnfaYPjhYqKekEQmk9my+FsuJi9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0X9zxRS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0X9zxRS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso4630525e9.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 02:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763633063; x=1764237863; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=;
        b=u0X9zxRSdKh1kRo3A3pcE7mPQJMEv+zH9byMeGTExC2w1/ACpAvabi+UVISJBp9XST
         zADnpTjb30gDt/f/C5Rzi7PZNbndEFBN9QUiC4r2bZjfvoxlbRB7IESs6nDQ6KCGMUy+
         z6lQy3hgIaqzavOUqC0H8EplhqHCj9NAcO8NBkB3+NYFBfow8Ii6sRyHKCMHd1/8aAMo
         S3KwxgzTi8WbVWCEZw96zgFVgO3m373pWEAWN4gvtN5amFpreX5TOlNp8g93m0X4Lc64
         k11KhFXmFgjcVbONGo9lkClWRuz27bQ0lY9FII4VkKv5EVLnUp/I35KjCJmsIh24nx40
         zZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633063; x=1764237863;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=;
        b=c+vsR8PrFgMmeqzaRCu3NZiTkMSHLOWpvpuU4IdZuHgt3QSNkelqM+SxpGsWIcrngb
         zrFqAE8+ybRj/QtqtSi1/ba2JtDamrCpzeKYJl4btEliQ+khm76Yc+N6819bNfidXu+E
         XrxLrTisXjEIUAwloCPf3oH3QJ3xlPR6ooxJXZJuGfTYljgWxXBB19Fm7/Pp97+XTA2x
         XVv5+y88+bvWjX2dLCVKMVVr4c0PSZN2K4vbGQeu9hRcSnsq9rFecnKpcp0UQRc/lMib
         niWkkZ1BiSzkgSyeczQ8NsUAg24cM+jFg4X+Zexy6iWzx1/HywG/TvjjnnjcLDmH04Mo
         Ihuw==
X-Forwarded-Encrypted: i=1; AJvYcCUvsDEHip7raHXjRjvjeKzik4cerwdaO+C+gA3qB5U56M0CW3eRHeb89mjj/gxZu3J8/V1oHzgBuQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+m/n2TBPssAGJjkvtgk5wWx6vAbsh+aOysuFc9UFZTDMQjD+o
	XDj+sugybsqHuWiOLqPyXxWytTSq4NyoEiATxOaoyVf+9aJ+FXd0YuITctDWSPHdwxI=
X-Gm-Gg: ASbGncvUnGYfB3xCnMrJjxvv7p/3Fi/yzazq2WABcvEE2rJNEX96Q3P15hYWEOwaHnF
	VkXC3NerMbNtS7Ce/NYremiYicqQUUitGQ32Ks04yAKxl/F80nNH33fy8DS5V0z9/f9dArep/21
	axNwU5vn8lNx4QvfI8Guh1i7LZ7+Ms4e7P0tD/2RRPx/0Ssbsgk0s6gW0NK2Bkcv54wCPB5SAVS
	2jxrrurSz9NU5Ew72z4dokk29PDK3JtqJ6SHGyOt7DAu831D8LMEx4YpgZaXwQN/YLa+l6dyseF
	dcoXXanyWIBdMIvwCVkk9VSIsYY0aaWSeXDWsIQ/8B/dtQMF3RsD9H6gDn1bsu0WEwSacnTACn1
	iccScJHSfXrnzjnktv0srINZ5McotK6gAXC8W0OWtMEHV+0Pf40mP7qchS48fKuDaF9DhP5rQWy
	0bVoAng1KoBk4nDw/y
X-Google-Smtp-Source: AGHT+IHrm5EaKYpV2W1s8pc4aTiYKHHkbeiQA9rV3WdkFR1VnTT0ZyX40PvNC5BuFfhZRUT8Fz32TQ==
X-Received: by 2002:a05:600c:458e:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-477bac0cfb5mr16019325e9.16.1763633062818;
        Thu, 20 Nov 2025 02:04:22 -0800 (PST)
Received: from salami.lan ([212.129.72.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9739964sm63387065e9.1.2025.11.20.02.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:04:22 -0800 (PST)
Message-ID: <b9f4103d8de37574a116164c50ac7e1bd09be80d.camel@linaro.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Thu, 20 Nov 2025 10:04:20 +0000
In-Reply-To: <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
	 <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-11-14 at 14:16 +0000, Peter Griffin wrote:
> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> bus components and MEMCLK gates the sram clock.
>=20
> Now the clock driver supports automatic clock mode, to fully enable dynam=
ic
> root clock gating it is required to configure these registers. Update the
> bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
>=20
> Note this is NOT an ABI break, as if the property isn't specified the
> clock driver will fallback to the current behaviour of not initializing
> the registers. The system still boots, but bus components won't benefit
> from dynamic root clock gating and dynamic power will be higher (which ha=
s
> been the case until now anyway).
>=20
> Additionally update the DT example to included the correct CMU size as
> registers in that region are used for automatic clock mode.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v5:
> - Invert the test for google,gs101-cmu-top (Andre)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
