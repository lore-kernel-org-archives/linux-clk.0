Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448166;
	b=RPzlG1cP6stZb18V2USWR2bsvuQ8b9oUNK2iqJxUq4SwK+zznfbQcHEl70MGL6LwOHmZ
	 33XP3Hnqxmhub5sGVnPrbg9YWsS+Q+UxkAJLygplUiw94Enb3kzFP1SfnFgVmVY+MEmhM
	 KTx8RxRtJLCCpdYeEsGL8UtLwd1lsD9P5Qz9QwHF1gNylbZj4RA/SH7s+gqXjSdDJqEth
	 GVpMqcmR1MZTDa6MlViU/+DJnn1mXBb5VG34Ls4WVADkh/i8at+cZ4mXz0+gDKShGY6IZ
	 ZKmP31a+TTk5J7KBkpRU+0/Ut6jplV8TReJT8t+B3HDChcc4w2KQQhTgitcSApc9W4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448166;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UXpd3Nh2t45ncSVSh4QPOrYvcJiFSBL00rNMi7DJgJk=;
	b=uuxjgGlyGdddbdLIsgNQi4OAlyWKMa+yejB09cz1Swz2FOJe354XOEzzPNJ+lNRcJrHZ
	 9mmvNnLubx55Fxb3lvcnOrKn/h3iyIUXmRrjd5fhK8MQ8rIBMT05G6swgMU2Q2exm/DxO
	 4J9Qxml4MYKGENhGaIU1ULBARtgDXlRbkr8I9hIhqhZAQWnGHggNGtcRu8/cBDt4yTzRy
	 Qj+hOUtM/A2t/G8aQNL4m775dbu6/ncmWwWPCbYZ0HiGqUaBW5jPr8RXX8aqJglBH0ihA
	 +4yUA95nPPVAcFvbprtD5fqhpn8zmQ1isCim8szGXiMVnb23MryYuphBrdsk9xPa2Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfPB5P93;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEA5606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfPB5P93
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBBA1F01561
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448166;
	bh=UXpd3Nh2t45ncSVSh4QPOrYvcJiFSBL00rNMi7DJgJk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XfPB5P93HP4vbKYlZWXIzvsr39OBy4OsyaLsBLvVeoS9AAZ6PTkbcgp0qeWPSkkrV
	 wxzI/QYnUkCNN+zR1cYRChx0Twos7wOKJ3HYbovl51vv3hQp2J/sgIQy95EJDqeG1w
	 eEDo644Q+/um0iNAjY0VsuG9sJTu9mcn+f1HdKCYRH2Mi7+1jsBXqUTkQBpWHC5Xt2
	 PFB70kEXrhiVblbGVZu5igGcOFMWyN8HBX9vsokuGGg1aOiIYOqzOIXjR2jRtIV3RH
	 7PhUC+AYpUv9Br5airvjFVcL/Qo638f5xSffOhjyZ6wWon88bDx9D7NvKQPwYtYpFa
	 fArKNB97Aa3fw==
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38190551625so7133586eec.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:36:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF5PuN5kdxlafh+FIt8R1M05WO05NXRkXIkKMPhLe8gxzpIxKKOBN4sKW/ewuVNKP4B6aIvjOsvu+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z96Kvec1WCKg+Hrr2WPFxAOlwM+JiOfFXV2xI6TxKJtETjDk9zD
	ZsQKR0690tV4KhImooyss0H4FsG18TLSbWrFbYgTHJwGGeMi5bOxvBQEvI7wmNoBLRSmAue1Dq+
	d/k8HKHaxFFF/gOLvqRT8+yJUn69CNg==
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr10673901c88.12.1795448165577; Mon, 23 Nov 2026
 07:36:05 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-7-l.scorcia@gmail.com>
In-Reply-To: <20261010115539.9237-7-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:35:53 +0000
X-Gmail-Original-Message-ID: <CAAOTY__jNESf=ZofZWN8SxBMkzeRrXEJv=J0QE4guC71hvBKGw@mail.gmail.com>
X-Gm-Features: Aa3M54qi2_k27JpUO0fxBJ7jBDU5evrvHmSEsv1tBfznyzC71R2OzkCm3lxw8do
Message-ID: <CAAOTY__jNESf=ZofZWN8SxBMkzeRrXEJv=J0QE4guC71hvBKGw@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, chunhui dai <chunhui.dai@mediatek.com>, 
	CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=
=8810=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8811:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The secure output control bit toggle for mt2701/mt8167 currently sets
> bit 0 (DEEP_COLOR_EN), 1-2 (DEEP_COLOR_MODE), 15 (HDMI_PSECUR_EN) and 31
> (HDMI_PCLK_FREE_RUN_EN) in the same operation, but only bit 15 is actuall=
y
> controlling the HDMI_PSECUR_EN bit, the rest of them are already being se=
t
> in separate operations later. Add a define for bit 15 and clean up the bi=
t
> update operation.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0fc721b2968e ("drm/mediatek: add hdmi driver for MT2701 and MT7623=
")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
