Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F063AFAEB
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409568; cv=none; b=jJqUvMLCM0YCpfKaJesSNUedZ1istDG6lKPaYHdBCiWdo9qotl2CpkulHED/yIYyW9TE47lW/Sw8vveI3mOPWPGkVoJa1Yem8fxYxGZsrgEi0fj+sQUFs5aX1lnDHIcWkLNLlFPyBeZ/S+x3T92jD623w20TRURWqTg3HlHyZ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409568; c=relaxed/simple;
	bh=fCbAzFePgojQUkvK1CnhcTwwVtnn/mTUFllwRqxoRG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8/4RrO1sTtFfFEN1G9RDAaUXYMy+bq5Wv3DOPzZK5PIW3dthTmhuhfQgpbovcXpf0r8axNHL+5mCzVRiCbLRkHwM2HLSlaII4wC8DiOI2p3NjBmPTXxmXyfxqhZtDMJrdaXT+j4dmJVTV4g6PnpzZjkH9w2i2PERModIey7C3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jKbvJ0Hd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OlrhI+hU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jKbvJ0Hd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OlrhI+hU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785409565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HWoRuuEQ7zJ3vpj2jIwSgIRqCCpU7QeZRVoWtE84e0=;
	b=jKbvJ0HdzF/Hdl0dG7ADEhOwMVzoUR6D1J/Eugd/DXIIUEWtye0AVff+53bpodAqfqRryW
	6kqyihG2lZcOim8NtSAIbrU1FdCjOveTbd/+L7vUZcsAFEaB+qRvW7BIesRXB+3QXU95nM
	mfz2s50kRsGLRJ++OeHEwlCNa4zddA8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-7MpSs2nvMfi16rvxyx6Cag-1; Thu, 30 Jul 2026 07:06:03 -0400
X-MC-Unique: 7MpSs2nvMfi16rvxyx6Cag-1
X-Mimecast-MFC-AGG-ID: 7MpSs2nvMfi16rvxyx6Cag_1785409563
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81ebb5e11caso63914607b3.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 04:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785409563; x=1786014363; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HWoRuuEQ7zJ3vpj2jIwSgIRqCCpU7QeZRVoWtE84e0=;
        b=OlrhI+hUuiwigki2u77Uqjh5qrzcFmAuLRrlz0p+IfP4z08qh/hwB8K2zLpYzheiWi
         7HAR6KoBSlFoREmmScYoOD8r+29tXgxL+J9tto5BqOgXw1TpMyONHW7xQkJYn/15HBBe
         wOmGepGNiAcNB0lcjLcz7CxZzU4xjlaJM/48RJ5o3zf1w2XUvVnnTy7ioXmzK7jC5ne5
         Uiid4K6EJPdhtmtKfnSyAfBQJL8Ctr/+xU553DAMWiaYTdEUILvBY2FigaAdkyy7hc9z
         kPmTwHY80fYOJ9pnUlV1YBBV9JvthijoJYHb6ymfZhnrhois5/aAFQVEmc913H2GLk4i
         NTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409563; x=1786014363;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1HWoRuuEQ7zJ3vpj2jIwSgIRqCCpU7QeZRVoWtE84e0=;
        b=AtRgOLPDkUu2ecIsp288tqrlMyqZ0szrXekVoC6Qmr1PGnmCbpX/QvWllnmyW3bjkW
         VULyevansM36n5VnO1y3NWfVVesrY8xYsclbYqEaBGe6yOkWM8h1CFb15FBCTimek9L3
         u3R+KuIKgFzxzqOA+Fyet6Zw48xBSwYip9X0GqNv+LZUISkq0mPLwt+4p0+wbqSUb8gi
         zJgXlB8FVuFwRFfDMO08nRXndUAV+6ONeUa/onrUkkNmUQs1WuaJl62HHn/4KZwFvV8O
         ypgZ/YvhuYOE9VVGuWLsfM8dXzVTO8eoQOfqbJkjNxrKP59T4GIJ60nL3TPAoMxx+uHK
         3R1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrP/hbT9R8Xp1wrOnbIuTHEs6DXDNsa0ZIUSG6PZ+uYYTHQXDIFsKI/PbzXXpZ7Q99KnHbuJlUmVBc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd5tAIwNO/pG4gU08qsYUJEctIElKLGTqiXRaBv+Qhbefksoyz
	4TUm+DAOne7S0K8R93LkUtWq3oS1TsqJhetwma4gM2VNiIhJhOpKr2D8aslRDt6MLutCZ80vR6q
	fdNURY4Bkj0Ttw/dgvn8x/3/1tMg/uOB1UwAi//lpU+0SlRCF8B3Yv0lh63qhLA==
X-Gm-Gg: AR+sD12IhBB1t91G40Qm1zHfJq6nDynLz0c30CV8ddb1b2WcBAEl7/FZO4pV+1K14/i
	DPY+8UzimZyc1SFVH8QtqB/ir4iVWQYE3ya/+eatcy9hwU5b2VUhSArX03aykUHYTuQhdFfEXBE
	PdFqvTvHPkoX0ofzOLU4dCIcZ+BeDeAJmAK9MsnClY+RITEobxhNb7qblO0deR6t488U1yw+gmE
	F4OUO56c5NNbGJKVZcs+UOSDl+Qr6XKnYdx4PaWBQyGmZyG8TqfywX9DD3dZFwIVnd8JZXFd+HE
	cpDmrtNU1dm7s65rn0Fs0mZW21oCt7YROU4VDsvKQog4mkpYliLrumsZsCf141yJJHetZ223/lZ
	FIOaq9RN+ozs3V8UpFfIfV+yr1qSKMfVZfpo=
X-Received: by 2002:a05:690c:6802:b0:7ff:1a06:472 with SMTP id 00721157ae682-81fb8953b7dmr15182087b3.4.1785409563074;
        Thu, 30 Jul 2026 04:06:03 -0700 (PDT)
X-Received: by 2002:a05:690c:6802:b0:7ff:1a06:472 with SMTP id 00721157ae682-81fb8953b7dmr15181697b3.4.1785409562604;
        Thu, 30 Jul 2026 04:06:02 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8b2975csm7687837b3.48.2026.07.30.04.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:06:01 -0700 (PDT)
Date: Thu, 30 Jul 2026 07:05:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
Message-ID: <amswFn2qWkvypMH8@redhat.com>
References: <20260728091804.382753-1-wenst@chromium.org>
 <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
 <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Angelo and Chen-Yu,

On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno wrote:
> On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 9:10 PM Brian Masney <bmasney@redhat.com> wrote:
> > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > > > > Hi everyone,
> > > > > > 
> > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > 
> > > > > > This time around Mesa was ready for basic testing, using both vulkanmark
> > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > 
> > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > - Added missing of_node_put() in remove function
> > > > > > 
> > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > >     - Needed since the driver implements PM domains using the generic PM
> > > > > >       domain library, which also depends on PM
> > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > - Saved error value for return in IS_ERR(data->clk_26m) branch
> > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > 
> > > > > > Changes since v1:
> > > > > > - Adapted to changed DT bindings
> > > > > > - Dropped driver change
> > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > 
> > > > > > 
> > > > > > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > > > > > some Chromebooks.
> > > > > 
> > > > > I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
> > > > > go through the clk tree? Patches 3,5 go through the DRM tree?
> > > > 
> > > > Only patches 1 and 2 should go through the clock tree.
> > > > 
> > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick up
> > > > DT binding patches. Otherwise I can push patch 3 through drm-misc.
> > > > 
> > > 
> > > Not sure if I can really take the DRM bindings patch through soc.
> > > 
> > > I will take the devicetree ones exactly right now, even though it's going to
> > > give warnings.
> > 
> > Apologies for missing this, but the first DT patch depends on the clk DT
> > bindings patch for the clk ID macros. This is causing build errors in
> > linux-next right now.
> > 
> > Not sure how we can fix this right now.
> > 
> > Brian, would it be possible for you to split out that patch into a
> > separate immutable branch for Angelo to merge?

Yes, I can split things out and make an immutable branch this morning.
But it sounds too late for that.

> > 
> > Otherwise Angelo might need to drop the DT patches until the next cycle.
>
> Yeah, that's so bad.
> I'd be happy to be able to resolve this, but it's too late on my side.
> 
> I should've checked the DT patches more carefully, my bad: I got a bit too excited
> to finally see this PowerVR stuff working on MT8173 and going upstream.
> 
> Sadly, I have to drop the devicetree patches :-(

Chen-Yu: Could Angelo add an Acked-by to the three patches, and then I send
Stephen an additional pull with just those patches? Do you think he'd
pull that?

Brian

