Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138467;
	b=LljCsZLXf2qS9OGT/S9VL6XMRIiPhATHmaxHeyjeuL/8tUFzmh3Ff62rg3lEUnFHwmuJ
	 iUN8QDX/yvYs3OoOmJeT07cVsSda2JGLB059h8b7mbJs6fXUAg5sOWr9KOY0PFZV0/XuB
	 Eu1rIeNWWWpou0zfN0CMYubj0HPipXQYbJxrKO0gUXb3GTBq2Zq4keOz082UOnlafvfni
	 TVw3yRmxg8nNjubkQLo1pU/cj2WEzI4bNJs2l2ygN67R9hsEPIz8b5+w78sxz6IbMA2j0
	 ipswp6H97+d/RXajBmSdIP/Ylmjj49KFhl/71nHQoDP38zrSp/GDujkyEXau7g3dRWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
	b=OIBtI3uIGj0hcvN29gwlJpbNyZbSuiDJADkGeLzCdCNyc0cpdSfcesT0OITFirCoM8UM
	 PTkUdxMu4jQ6C3IBWgDTOWWMLdBZgqI1SBPwJQv5X/AHz03mvtJa9WTb3+g7we7rSB1bS
	 s/HMnIbOcSwLdXExsxNmxXSDCKwUFsAqhpxhL1qlQlcpgv7LcQPWY47Z/7cUK4LOPx2Sy
	 Lrn4aM5eQy8lISeAG7jHm95SVGKiumTTn1Xlqs50Mn+4J7FdKc6HcfJLH8jRyVYcWbntT
	 2PSHXPt7N+bCAAY2fIyL+5IWMNmNWpzyIF8KCFqrDTM5ARUVlLY+LfwhvfeoaqWZpEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="XBMkG/II";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855D3606A32A
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 11:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855D3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XBMkG/II
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c445c95d553so5867066b.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 03:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138466; x=1794743266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
        b=XBMkG/IIcRv2erhu0jLaUyRAxZewraw5dmsWN3hr/txMuy8Pcpc2x0D7vuGlZPphI9
         gRZvOga9mqvWxhPARZxqRgkk/+kxoUSkKfxz0ZWOEy1WEtBbk7AkkYeWFRi/ldzlivXa
         7DXCGnN8GohkSU7uwFuF109XOQveohNLVZfYFXtqr7sk6/EbRcUTh/WV5abnKsqG6nuc
         tzIl55i/zN1+cK9Bz16/UPM29dp2cpvMLQo6Q/TdP9fSSw+4j49wcpxK9edWYfvPhbCS
         eQanoJkJ6vbOLAcDwlyFKxonmU783L4jU2aJOV+/eyjjw7B5igoGxDacquIwVDQA5VZp
         AXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138466; x=1794743266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
        b=iiirTJYx3MJJVqONb89gE+HfYf0//Q3FjaOrStrcx8DzFEQhGOfMh+JaLxiQYmXIZk
         LyUR8M0ugbE/igZkcI6LkZXDLz0mtQFRHGDj9/Vuk/OUxdYXGT0AgekmUQYldcyyraQB
         zpEsnctVIxtlc9Cc1zsfUI2Vpx4tQ9uSxO38ug4zmx2DIfFzkSkL8TReqRyzvVOvGy5u
         ccDDiixyYzBtyaiq6wzcysPEa9nsO/MqaB0YWOT1smk++jxeWSMAobt7wmd8rDP+MBaS
         u0ykDNoM+YSend+TeByo841bfZz29ylCqSfeL85oVZ6UA7uM0Gc4lKMVRZvYONG6Kn9B
         tgDQ==
X-Forwarded-Encrypted: i=1; AL+hErHUlkAlxsEgVcq/21gQrZHTfyf3zsZ7KaFQeQ0VLtJoDgusDPG8M68Q5iVbmA2pBGB06BRbGsnVeEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z99Q+KD8RQA4h8J4CaueDU7A4YaZJJLeCuY0xbvJ1DBRDvzTME3
	uRxKp3ROe94WH0NFWLLrkDoBpzdqdULi9V/YXEH0pMDckVHB4hGO4w9ncy3uQLp5BQ==
X-Gm-Gg: AYBFou1OrT4WBN+2Zi9ezVvGVGRH7/wiRZ9gL5mIRPCzRi5dyapFw3iGu09GZAYMfZG
	Qskm11tK+aEwFvyrQh8O3Z595T1hZy0lxv1ZOalrcRmkzT5gE3DaTZHxztlvDcUr30mgoEXSpIR
	wEkuCD/EXyIq1+eq2UWqr2JvklIb+Hhd7mU9O0BzHpcBVDA/Q9bVbVjgA7OvUs0O5dDQE+T1KIX
	ee3bdOFXm6/nOv/e4NPpjjXOjqPxeFBpcrJzXf0XU1Jjc4uZVzHXOaXSUUUXdy4Xzl2aWYOIMPc
	mmzuiNXLFiCppg1buWyxHuM+ZlfO0WFA6f3nvuUKGO1a0lGg8oJDYaEj48kT3xPa+WpuoKpOGKH
	XTMHfLVT/nSx8KzAyT3EghVhHyCHR9H+JqMindebW28OZE0zKu2XbIVYQMDiGCfAbMO2rl1sABW
	Oq1NGot83II8Ru7sPqIhQ9FT/Y/MaCvMUhzOKlgdYvxwElZX56KuRKJCqaOLkGrqN2bPq4PWsPs
	V3d6AiwcnXFZswdI9HoJ3J1b5+n23qIjei9kvmLXVE+itRBVAiJSCkjgXqJSRnim1u/+BgGM4hY
	HXoTvokW/YR6Muzr/2gxN3ZhYFtLM0bYUoDjOQvE+1mE+Cs8LhuS9ArZvvTMGK9Cm4bNaYKrTXv
	9cLGsHbTQU5Wc+vpiiIZh3Q+/w2CpTmgIFJ+LWn0U+OCcLRvre3wslOWRLAcWZC7aGfK3qdILvU
	CUYRUjm1A8XfHVxcZX91nEAwXKlO3iL7taT7dRCXh0hyGlYPguKA8P8G0QycTxG2nikQE+Z26V4
	zFAjq0Z04DCrbOII7WIfulQMuoIxRA7eieXfkFFthirBX0qUXEJsqxEKMdGK9BP4PNiv4eFHc8L
	mbEI9hZTJ68i0v2/2A==
X-Received: by 2002:a17:906:9f88:b0:c26:19e3:e98d with SMTP id a640c23a62f3a-c4d6d8ae41cmr91002366b.45.1794138465886;
        Sun, 08 Nov 2026 03:47:45 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a993031sm56570566b.68.2026.11.08.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:45 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robert.marko@sartura.hr
Cc: konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	sboyd@kernel.org,
	abelvesa@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	vladdrako007@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias PLL parents
Date: Sun,  8 Nov 2026 12:47:45 +0100
Message-ID: <20261108114745.125841-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
References: <20261020065430.1251541-1-julius@bairaktaris.de> <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr> <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com> <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com> <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com> <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Sat, Oct 24, 2026 at 12:35 PM Robert Marko wrote:
> Thanks for reminding me, I have sent the IPQ8074 wiring.
> IPQ6018 will follow.

Thanks. Please drop this patch then, the CMN PLL wiring replaces it.
The IPQ8074 series works on the Xiaomi AX3600; I replied with
Tested-by there:
https://lore.kernel.org/linux-arm-msm/20261026120920.1667982-1-robimarko@gmail.com/

Julius
