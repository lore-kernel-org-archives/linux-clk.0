Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516EA3A6F0B
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 04:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387097; cv=pass; b=L0teF6nK0WdL0R6DU7jxBQ3cvMdODCDVxnQqq6azPUV0mf2++rJ5/aUqLwxGl9KOd6XxQ1CD8BRUnJkMYamQJe0OfCFqRYlv0EQQJC1Q2J58gp4eIUlapQRjB/AAI3dkGZbkSsb8PG2WyZqgzekC7k+u+kY2T62XEDKV7e7Dhpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387097; c=relaxed/simple;
	bh=NYYY6bXttSIzHd98I87BJHvnHe3viVIhQmcGl5Svy7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5JMmfRlE2uamht0ux+GUk5ZkxTWANOdqYKggv8hqvJKrhHoN6IURsnItnVWTyaGx0m9TzziKPRkUsJeJd7z1tscydRRz/YO0G3LWJUQhPufe3MSOKi4hifxcR+GukgyFdTR3YcsPuy1qv98u9es/vopXvxFDUr1Jdghrwe9G4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kTK6nQX7; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kTK6nQX7"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81062fdeaf5so6517797b3.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 21:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785387094; cv=none;
        d=google.com; s=arc-20260327;
        b=XIKlE7l/AIgm2sCUReiol4oR/HZSOnG/wzkep7gOybL2VibNuX5gEoSJ+I0baFYdsj
         kBT1/LhLHfy7WI/RYgn9RDoZ8TRnaWsWKHPJzQzEiKvbBHEI8pFPtpwYmblewikKp3cm
         6PlquiqrXI3tAAI05RmvebBMhvyNpgLfr32tGmlqyhGy0PTj0lkNkyaSyvkqJTNI5fZX
         JZTqXpz8ukBhYD6nkYYyMzdRW6aRjnqTD6X7tPUNoagM4bm2aPpiDsfXT5sfb4epzhD8
         NBH3Y0trh7JOaVaIs7Qd4ANZU5VvGplBQcbYy1bhc7ZZ6xzBpGH/HwvkPfrZqDj8p0y4
         yaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        fh=HQAfm/hwDQ3iX22JHm0oKK1m/POkNbx4F0dnMpy/IzY=;
        b=HZoXbXuhsFfq5CL8gB6F4BEwRHlWu2LnT/apUAgEIARYJdLd440qsXw6paxdnchB8C
         t8BrJvkJ11E2TYxu++fWsdvtUnaNqG+qr5BpHuGyMxXOWjykpC5amPKPOoMt+vBlCXcW
         qiRmYeJT7O0R6Q42dFntMLe63WM4FOJKlDcNp/lcVUzOxXDe8+kZL8RkCPEqMr4JOCgO
         bPgJ3CNA8IfMRBn0rkToID03s2E9xWsKaPR/lKxOQGRwB4gGN0UQrS5GZqiEmpZmchEz
         CYCDqJlGcz/yRGOEyHrbXSiyXa4pv2KZkuCqHVz13ufNzUluYZH/aMxkC9UTs3xbrgsf
         kC9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785387094; x=1785991894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        b=kTK6nQX754cXM0nDYkmY4QRWsmAig8DGa6FUCmikhTJkvPoCgIQNi/qXdRoG3dD8qv
         E6RHq5IeHGb9ySlDWYx6t9FTa8uLxmXuQio53m8L7Iki3aLvjUG8JWZJhRifGECuuLHx
         iM+0SppT99n/nUPtgv4ogUlejJLz43eKwZ8PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387094; x=1785991894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        b=USMXTUYdzsosKWShr/xA2ax1WtXrzROOsAWYxFUpiHn7so7XAIbXXYrSUg4LBnp75e
         spC0QZr9VH2KhVPIfmtEu9qt8NABVvXeAbBOB+0zkgkQbClpG91ghU9RxjFm6c4l3EYL
         nRuFz5fAuxfS9Xigs634BQuBHr5IluANAXmpSVk8V7QEcO/QCTgOcdHXUhV0SAdGMB8+
         GUA/DAptPtI/wjy+YNdwGGCfhYzbWF4CCSNzHnhvImfMRwXjDMHVc/GrSyOoGciyqOps
         Q6pbAJStJts9rMGwiEgsbu8UdlauGmU+0xRarTqNxwmVe/pwpNhezUyzNBbJqnf6fEwx
         6ikw==
X-Forwarded-Encrypted: i=1; AHgh+RpSizAPeLWHBkoIsd8B0YwUrsBA6lUfhmVqIAN4dLHY9IICW9ZNaWSl9TDKsUomC3/GycGauVjjKtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydOlL/B/WmigcEA5CwulPBZOGk0geDeoNwRwCDZrINRjLljCKh
	O63uAZwkHAYq647vWhU0tygB2eI9QBfI95OzOey5rj5tgjI41w0MYFaFkY70Y5Rs3N0H3skXN/g
	RntBHFw29EC87LvZW+g5opFGTy2t7RXhKYgPOvNTz
X-Gm-Gg: AR+sD11G+80eYSBNuAn3DbrR6T7IAsP/YJvWhYPwxFzzkJ9XbHsWwytAgJBqulpr3TU
	X25OMwdcTlBqDsaK/MO99xCn4FJ+pW2W2+xGvlZK+WC/stYxhIlMdIrb2AcR6d+vRODLUFIB8BX
	W5fwHIFo5VR5KsFwCdpNLwZw+LOxebOYkYbJDIGrGc/DpQBUtz9dIfsdgglf51ojzvypZaHq2aw
	dfdqkprnEoqEEb+e8WvE0L8oMGa310A6ijiHo/i2uC3ZP9zvbpavCcel1UErqgn0NdSHldvMjU7
	mdXud1pdySFz9eoJP9YpIs5GOrFqKs5EFgLE3imegxnWJBSE8QK7Dw5KgROxoqJ3nubw+ggqnSN
	u+x8U6i4gTA==
X-Received: by 2002:a05:690c:288:b0:81e:ba92:b253 with SMTP id
 00721157ae682-81fb964be1amr5292937b3.4.1785387092765; Wed, 29 Jul 2026
 21:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com> <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
In-Reply-To: <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Jul 2026 12:51:21 +0800
X-Gm-Features: AUfX_mxnxexVKpsRakYQvwrmIlkydC8kB3j1QZQvD5J6WTjr-o8egQw_wYmWxF8
Message-ID: <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> >>
> >> Hi Chen-Yu,
> >>
> >> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>> Hi everyone,
> >>>
> >>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>
> >>> This time around Mesa was ready for basic testing, using both vulkanm=
ark
> >>> and glmark2-es2-drm (with Zink). Details below.
> >>>
> >>> Changes since v3 (all in the clk driver patch):
> >>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>> - Added missing of_node_put() in remove function
> >>>
> >>> Changes since v2 (all in the clk driver patch):
> >>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>    - Needed since the driver implements PM domains using the generic =
PM
> >>>      domain library, which also depends on PM
> >>>    - Fixes build breakage (kernel test robot)
> >>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>> - Dropped unused mfg_desc (Brian)
> >>> - Added check of clk_prepare_enable()'s return value in
> >>>    clk_mt8173_mfgtop_power_on() (Brian)
> >>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>    (Dan Carpenter / kernel test robot w/ smatch)
> >>>
> >>> Changes since v1:
> >>> - Adapted to changed DT bindings
> >>> - Dropped driver change
> >>> - Use same power domain for "a" and "b" GPU power domains
> >>>
> >>>
> >>> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> >>> some Chromebooks.
> >>
> >> I'm making a pull for Stephen for the clk changes. Should patches 1,2,=
4
> >> go through the clk tree? Patches 3,5 go through the DRM tree?
> >
> > Only patches 1 and 2 should go through the clock tree.
> >
> > Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick u=
p
> > DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >
>
> Not sure if I can really take the DRM bindings patch through soc.
>
> I will take the devicetree ones exactly right now, even though it's going=
 to
> give warnings.

Apologies for missing this, but the first DT patch depends on the clk DT
bindings patch for the clk ID macros. This is causing build errors in
linux-next right now.

Not sure how we can fix this right now.

Brian, would it be possible for you to split out that patch into a
separate immutable branch for Angelo to merge?

Otherwise Angelo might need to drop the DT patches until the next cycle.


Thanks
ChenYu
