Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004429B799
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789199428; cv=none; b=lZTs0EbIb9dEUQRK/qsJ08i2tTTGO8ktRXmLmVbYWLFA9yf14wS5kwdBg86mfG7DWGboMNwWvaJ3lP2t4E5S90NCv5djKI8jJnRDg1wbqZCjG88kpLWB8sHAxJap1bqIxVQ59a0M4KxdO8nGd6IQYlHttbxfIC+LquzlbRXkUYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789199428; c=relaxed/simple;
	bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFt8jXUOpishFcZOvqOeh4BjWagUxRig49jV1J3xIWc1ie8er2g2WVqX8zSqzLWcPDpy84JOLsKuL1De7Zd9BNZF1fASxQpFHL3ByPsPcpel3aNk1DGHHABVnbJUfFEBb4DYnNkKIRD5UquWp0Rny5cjUwtpcRzhIr9uDIUZU2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4ddd17a0so5863887b3.0
        for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789199426; x=1789804226;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBk2CBRDahK1Lh12GNmBkGqI1rSJ+RuEfJVc5A7eMs=;
        b=hMps5HggtjtsSFh+I4YfnQRjq54c+U13ljbNAPPc2rB5PC0C/5/hRPyytug3js37GN
         PVwEsECaA0Y1XbV6jICa2mVQVXDxOX3s9rjFDjRuDq8n2XBgOT4MhX35RB1Fe3mCjEUn
         8O2ZgyM2mLN9MuK9m8MFUDxOAoh+Q85piH+38hvWxq8h5krMUdDCNl+9/KaeMlolnwQ3
         AzFa+dI0Bjuu6nkYgp69c3jpIcOgBSCu6kZJKj6LgQpotxN4xq/QiMSLBpagWaLCBtKH
         aDdThlOQTPE6Dg2RB1/ihbF3gw6ondUyUlSCaRRrD0eI3qjCyxpQVDVZXtuCP9hGLuUX
         3RDg==
X-Forwarded-Encrypted: i=1; AKwUvBxCBdKzhRQg27PGcWNXlW7IiPb5myW6qKyrElElK8252KPnPkjcTfS8VtlUFEeINcp0qiAB3D/6t0k=@vger.kernel.org
X-Gm-Message-State: AFuF++nF+hcPfNp3oGsQBXdHSH2S4mm+Nrycv6pgPcHOvVbOh+AV0X4f
	aED6VHiVB338UL6Nv/O4WvKqA2eJEtQ8IHFYy0iztEnWbjgQZAMv14g/UtVsADRd0L4=
X-Gm-Gg: AYBFou19tZJlyfLUzrpMeWuK7gfAxR3x3yJzTb1JoA3dLpvWWP8QvavitzYQmBVfrGq
	14AGRLwucukhsmEgC1gXth7gSS4IEAwqC4JuQGSAbmg365aQWCHvy77tEVpilU5owk+tErF75od
	CzEX1JywL/fA8X1eU6U2H3I0skkytoQxv9tKRFs+8w1za6RMVqsszb7VWBYIfAWrqIa1pk70nRP
	eSlffFb6Ohps1ovRm2WcHWSKBdbaMAtnzuB1jw5WzDHNBrp5Wp0RcNWl+Z+wA4SESllzXfdv9bC
	W23ZozyHbk1hPovJ5a/TZ8FZO7L2neO6bnAcNCjRQre3/5yF5WK4OFYhTXrEFTyjvJcePIhRoTV
	9CP7ROUBLHf44dIlVeWL47YTaO2jnzWZGlDN5HWnTG6c3wOMfxPCkETXh/vLli9zztWcYj02Uct
	LWHw+7qJcdEBkmVwTfaO+dyK1WZjKIyeN4euoxzpLO76oHTyvQ3YK/UuWmDCw/WFliTBBur+m2Z
	F8lOk8VUa+NlRdkimO9tGokF2HsdkAU55NwtasAxKdjEjhjdMIbBXRHPBXiShzf
X-Received: by 2002:a05:690c:97:b0:81f:e85b:f9da with SMTP id 00721157ae682-884b4b01ddamr30061377b3.33.1789199426288;
        Sat, 12 Sep 2026 00:50:26 -0700 (PDT)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com. [74.125.224.141])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88486e2ecb6sm19298987b3.21.2026.09.12.00.50.24
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 00:50:26 -0700 (PDT)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab19127so453029d50.1
        for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:50:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9++EGmCnEIC49Y8+XykTdQZQXp2lPDTPFy/ebNF6cIXyp/RCFfi/R679KNi6GrUEQSf7qcZDFW1c=@vger.kernel.org
X-Received: by 2002:a05:690c:97:b0:81f:e85b:f9da with SMTP id
 00721157ae682-884b4b01ddamr30061107b3.33.1789199423193; Sat, 12 Sep 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com>
In-Reply-To: <aqSX-kUvYaixESxe@redhat.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 12 Sep 2026 08:50:12 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
X-Gm-Features: AcwNN1V-hZOzugyfoJiJeFS5rmMdeoAyBQ6wZJLEfk_Dvgzhb0zC99WtQCvbVRg
Message-ID: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lucas,
>
> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> > identifiable consumers - the three MMC controllers - so marking it
> > critical was the wrong tool: the clock should be referenced from the
> > consumer nodes and claimed by the mmc driver instead.
> >
> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> > have no single identifiable consumer.
> >
> > Assisted-by: Claude:claude-fable-5
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> > This patch depends on the MMC controllers actually referencing the cloc=
k:
> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> > clock must land before this patch, otherwise the boot hangs and memory
> > corruption this clock caused are reintroduced.
>
> This series should be merged together in one tree? Which tree? I can
> provide an Acked-by if it should go through the mmc tree.
>
> Brian
>
It's definitely best to keep the series together in one tree to avoid
boot regressions,
but I think the clk tree is the better fit since the core changes
revolve around clock logic.
Could you accept it ?

thanks
lucas
