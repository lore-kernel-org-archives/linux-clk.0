Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193DD1E492A
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759993801; cv=none; b=u8wNRepzPOjHo8w5wBwXqzr97UJRfxpHG3u87vlIIr/Y2HgtKuxFua0nJGQiwh1D6cFP///Z9RJvM3uoBYoDT43mCJ89mR4rOhUQTyCsbLStqia4JiUhshcZFY/ty+naU6TYGxX/Z8e2AY/hfP1R2TsZQG6Q2GSnNML1JWe/jxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759993801; c=relaxed/simple;
	bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7rKk1Z4Qiv+mAGMN0SAWwVIgz+6LCLgqNEg77B+wA8oX3fZmKNhRreuxnZIv/jmUvuvyJxkcFTSYiai2AznlkHIA/FMTdp3C9LagWXevo/+qnKBUD6RqqZL2M9wnZIM33xhlAm8jM4G56MHb8tH1h5sIKH3684qfXnF/sqz9fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eQ4QEsnH; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eQ4QEsnH"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-371e4858f74so7942341fa.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759993798; x=1760598598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=;
        b=eQ4QEsnHg0aO8w/ehvMcNELyQkHPCwkdywiG8Kcbf0OBKX/cF5VoknNgYeDJF9SCFY
         3ZEqmodTVzTAWQO2bMqoYMAA4QBsWF7E+Uz0ue+46dE9HQsylYS7s9ZmLZ2i/L9z9nVi
         Q1qIHlttt3YVRuEDp/myrOTeKT0TMV8joEkgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759993798; x=1760598598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=;
        b=HNIX8WUWISB8ImME5lbH9JWI7BagTvtt4hN+prz1sUVCefyArkf4TiFGd8urGawCSi
         3WHo0L6p/uZCwuVM7UKONeuJzyHKMR+UMIg6icLpRQewcNrs/ATlHPa/MD39uAbo9cp3
         H+rw9Nrw+SkYdVAD28W5noiJESfvWLdt+bBPHPsOelTzobihX5fM0nijzJolyZAgCVIR
         Wu99mo1vTbt1vqFgI23/a8KPEynH/cnTb3X+FHDeRkXPuYofj+0nRX+BE8KaQWoEcXsR
         9JrkwGKTmrfmyNIzpv/JUL+zIwhws2tgH/Yf5ay2m67tZ/PJHIRyNQyjAGmzltTqjP3U
         9ztA==
X-Forwarded-Encrypted: i=1; AJvYcCXUM+huvOW5la7y2YHIW6FEqfmEkbI3H4zO+uk3SjxxlAtEqyJGv2AtXnZ6e77Z8z4+YW13sHbafgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdsyKdkU94LosbNRJcAWRG9Y8GisZzTHsMyfPhY77nQKN/QNLr
	2rKHGiL9WmtJxalnVrNS/7eD6EtdupbIFNNsPWkpcKn+o5GrUhgqOsRuma292EWe9YASiaoYnrd
	CYfPVIYBagM+yJPAdqr+TLxy2GPGSdcx8XbOLju4D
X-Gm-Gg: ASbGncuFBqdBia2wS7SPqCbibGz/iPeMxjlyjKzc1BW5x3UFpW/0Wh7H1a9l4qzxTUY
	FYxW6ZIE0T7c35u8dltqJHw2/jn88kBeLeRTotvRgYh0jhjZXRibQO24FcHOYRLS5OAG3OM2uiC
	TIQjecR8FjY3ZWGrsn4DVPeBZRtH5PohDCK2iwjzmo/bDh0NoheU0qGRu1b4jXJHTs6ZIc4OH41
	5iI+eo0B9JkXfhqy3vdq36/5bbBF35rrLchAGK5aUDiUKhpBelZwV19NfSTiA==
X-Google-Smtp-Source: AGHT+IEJhbj8B5bmWohXhF9RO2rE1lp3Eq4MRp9b8SXg6OKS6nhaW5FvJnYrKALXjGj9kyLiKxmA5YOScYogDginsYs=
X-Received: by 2002:a2e:be10:0:b0:366:ef7d:bab3 with SMTP id
 38308e7fff4ca-3760a2aec91mr17588391fa.1.1759993798125; Thu, 09 Oct 2025
 00:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:09:47 +0800
X-Gm-Features: AS18NWBfT_0WimyLL897lV8iBPOUkT6dheJLRJo28H-RJf0AZ4JmglLtj3pPXGo
Message-ID: <CAGXv+5HAvx2uqJM7hWyBpF=wPZLWmCkKDaBnSOsPnU2+YFM0CA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
>
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thank you for taking up this task!
