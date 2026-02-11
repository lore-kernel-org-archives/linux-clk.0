Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218A2F2910;
	Wed, 11 Feb 2026 11:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810083; cv=none; b=qSOf+k9iXbZqVhZUXfoesTck+Z92NXht80JQvTYwTKW1IL9nJU4q7JcKXoDlexXf0uvbOX6AMw5Wl8C6o9SvUEp2SFgPoOsyHy5U+01XiRBUMhaVN2s8g7+H3wABCGNs04chghU/9VnIdEc/Vj563ek2uWvhp2qFNphoW6E9KKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810083; c=relaxed/simple;
	bh=wTvfPpSOqU3Q32ReY1e8lm8orpQ6MUKDNS5YGKdrPPE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YcrALlHLi0/QuRLhE8aloT15727vIf4+OEeIh3hIxQ0WoClcQLlRB8xlg4Lzh1fsn+3ycP8oIth+tWNAtZtSvpesjQGATPN3WZVch8R+L6mDHYwMEzMvEXwpi7ouEkYY9Y7Q5o1lZ0kGnK+qj+U11Gvj4P2ZQAov0EU6wp4UN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ziswiler.com; spf=pass smtp.mailfrom=ziswiler.com; dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b=UyzRWZOL; arc=none smtp.client-ip=74.208.4.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b="UyzRWZOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1770810058; x=1771414858; i=marcel@ziswiler.com;
	bh=wTvfPpSOqU3Q32ReY1e8lm8orpQ6MUKDNS5YGKdrPPE=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UyzRWZOLcey82rRiYucy2T6FkCpbQL2N1Zr8g29rInNp4jFNr3t9eFIiB88QQ1hO
	 XjyYnxZNPUdJ3MpU2fIBj+dx9RxrSychJh3MDMUwYuBzcHVlPl9k5uK20oAeWsfoR
	 HS9kL7u54D47DTaDGj8ZFmiyCzY1MpfMKJgTNGsNt9J+ns4xcX/cK0CQZNgJyAWjt
	 SuKdbh60Yzt8D9t9laBiAO6/+vnUk6j3oHXXpOEISufYmM7RseGjgF0I2OERqT8ie
	 r4grIUw3BHjIrfPYGqupVv4j26ZWc24RZN/hjgTKJspgL4qye+o6OjVKCR8LeFMY1
	 X61oKgHIOIju2RGqXQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [172.25.13.253] ([213.55.223.129]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1Ml7Am-1vMXPJ2Hd6-00mDuc;
 Wed, 11 Feb 2026 12:40:57 +0100
Message-ID: <33528fb083d704d0745c52186673a355d274162f.camel@ziswiler.com>
Subject: Re: [PATCH v11 0/3] Add driver support for ESWIN eic700 SoC clock
 controller
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Bo Gan <ganboing@gmail.com>, dongxuyang@eswincomputing.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Date: Wed, 11 Feb 2026 12:40:48 +0100
In-Reply-To: <4f6580f3-3759-4b33-a3d3-54bef0a7ae83@gmail.com>
References: <20260210095008.726-1-dongxuyang@eswincomputing.com>
	 <4f6580f3-3759-4b33-a3d3-54bef0a7ae83@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:yEmbkGb16cYWhKH3Ux6QhU5q1fi66TsYCkJN0FplJpr1ei4lsXE
 sDpo/ovFo9kmlakDlhj9Vfm3Kd/ufdlKWzxkEeBOETH5j55oXJG30SdTDss5J5vIlMDQil5
 +8D+E1QyvYai1HAxoK1cWQjjP8jgGuZCphucXcb2ig35M7cQpAxUypL60cx5BFUyMLSGDMj
 M2rDImytLXfeatxg24Xsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WaMLAn5QpQw=;qwQ4p2fiJFecxh+AEjLyD9kL+S1
 IxsLea8RkubA69V/Vb88IPi5KVJ5dK/rYlgHHxDRW71HYJ0U/cgaVVS3a4aaLZVlGXIOwLOje
 GrUvDXl6mKa0JKJBNiYlEdRH31AJ/kSBoeyiNuhFiBiMo7tu5k03sBWqQyUmvgEcafIia05Wh
 yWx4QxRucW3beQMDCnZ2nb/e7cXXvr5xLTTmLMNeE9Favuv8WCtCatSkwb5y5Q4T9zAhHnSN1
 eU/3EKg/Aapjc0ey2AlbS672jRSxIIMo9HnXXlNJ3s+LOj4v6xbr38U42m4grlOTbXrHJWexF
 6JXLNGSYChRYkWylZ7YYq8MRqoFfyfWy6pTvxzv/gRQBA69LHXJXTQRkQ+xux+yg9pZLb8bfH
 /fGTzLRRtWW+tVkYzoX1fAJ4RPF+kqaNm85lhz8U1zvqvfV7AHR8Vj1muQOx74LKAeRl+HI6u
 q1YbP8y8c9M936T/EPVol/bFVJ27v0DoZnfkk/YcKyF42LuncHZrnfH7c6qYQWtpONlUsIuzX
 qIqcJqYNKm7kgeitWZSMuGVi2rE6te4x6bW2k0AOSnkliom/R9qy7OwJU0ONGbVFB6xHLbNlX
 /L0xQneqrxvzu1EqhlVoWCeZtVojWJEMGHYenpPh1hW0jRPZp8yW+v/qApuWQRPWwjQ9eODlB
 FGfwz9hne04qJMWfXMaiQt8GDXYtbRbBdzs1hCr2V5KwKvPWKx/6t7fGxNsR6wI1h05NIGgsM
 EKZFn6ZT3DDdiXerGRdH3CoQhGvZJHWBjjdNX3KfvOwBYGU4l3Go/KwqtcpxAoMa8scbXwp8R
 ID45Ng7dGvEsKBSjpzT4/auHvvYDSCc5uZiGoCl15FOsRfYTpr5957PapIxjDX8nSYyIW5ezr
 H56/YOSQzKSZXVNxYUXdUdhvTCfOy4uWGojaAbpBA6yqlxUt0EOsmRT+c/qzInglhjQ0eqexs
 xZAdEZxAd5j66zIBVGtq7VhlYi6/PSigO2K3Io7wgp2QnTV6dNosoyZ+PF0JeQjRuzS+2myT/
 d+OOxtJx+VsL2Ukum5Ap0+spAYXrlDD51h7boEJF3ANgWkREwfWI1D0ojJ/5BY2Y0nXo9udS4
 zGMFTnvW6TOibyo6W2c2zuqlkRxhWSguR75ExFLZPimE5kiTIvtYyRF+OG+EGmvNCR0pjQhel
 rhMaltSCeKAL9hKuu9a8KgVn84abYLR2E3sfbE14DHOcYttcVakBgv8qdrF6rPUA8Ueb+HBHr
 C9qBKP/YNolraAKYx6643jC1kySYEq/sX6WVPrvlAUzf2OXT+S4j1wWDnokVA0NBULnQF+loG
 4dgdZ4LX8tVNSCMxwrEoAq3nReAWZoEwm7xQjalM8qsj11OseFuxSpHUjax4AkZAK+CLgseAA
 b4gkqL4eGXtr4ZBkL6zw0pYPP59X/VZNz01iSxx/7OcvdpHZa26Y0WZJna5lWLiGlY5iqw0IN
 TjWcObg+ijKGcEzZGzU3ea+QwBnz5jZ479GHEdXg5+gqbGR6cq9gSo+phwp4Wie1s2JUSmqkM
 VKwMKrVIJGwtL3BFNzrvIG/x/ouQgmp5d0UD1IwOpbu8VtT7a3djfbWpM7n1a4nTRXHFD+f6B
 DSQpWaP655jODnItykZvRCYJHLMGrG6YLo3gnsbF2uuBfEs++kXvI8GAQYZXOeT1Iv53bjb8J
 WSWukz3hN3Zj9KMPqvE/QpncYlxXU2xlTqku32OvO0PgIT4XMh6u6UPXEtRkqoIcdKp3BZFjG
 ahSMfOVWFOHHMEPj9ljnR4vCwSAjfRIKu3P+nD/hgS5fGftVCCq6m9og=

Hi Bo

On Wed, 2026-02-11 at 02:53 -0800, Bo Gan wrote:
> Hi Xuyang,
>=20
> Do you have a device-tree that can work with this patchset and enable
> eMMC/eth/SATA on Hifive P550? Given these drivers are already merged,
> I'd like to test it myself. I just need a proper device-tree. I checked
> your github repo: https://github.com/eswincomputing/linux-next, which
> hasn't been updated for a while, and none of the branches are based on
> the latest v6.19-rc7

You may find this [1] helpful. It is re-based on-top-of v6.19. However, so =
far, I only tested with micro SD
card on EBC77. I may try Ethernet later this week as well.

[1] https://github.com/riscv/meta-riscv/blob/master/recipes-kernel/linux/li=
nux-eswin-ebc77-mainline.bb

> Bo

Cheers

Marcel

[snip]
