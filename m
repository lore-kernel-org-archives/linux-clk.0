Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330175;
	b=clyVX8L5MJIVjkgGYv9zHdktbS/noxeeql93tM9eH5lDqIbljKjDfKqa83eNgHHPYNg6
	 KOfhutD+Gf3f9VsN8KaipJRwyYwccptsdk1ox9GqKr5hEfzrq3lVAvIvwxfVhMf93APa9
	 3GXi/P+DGdBp/hb1APvpURsraNy7KsVsmM9b8d6hL8niWAr+gQVE2vpEt+KB4XoqNhc8e
	 FDyIIfc12S9cUx7s1/gucWj58kGXntLjs/TmhxBzPUqyt+Nvkkp5nP6IX2vOyLOiv6nZ6
	 u3NtZauoIczfu6utKo3LCoc19laa4N8NPhWwR2RWxXFGAwwMAenxP47yB+KhuKGna0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Subject:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
	b=NvpivfmFcFjQPZRBLSmimmmr6MuFqY7Z/Bgr3faLFLSt7iDIU6iw1EmNpdOeWnUzcF8T
	 GjRY+Pgc/gbLbAHLgQERDNGudGa9TVlq3KKhMe1JxcW5hMiv7j5VwTlRZKpWWBIBja5IQ
	 CD5hRp1dnrvzyDl3MpWszUzz08JomIm8s6jldU1qzyjjlbflU9bK9YLf89t2MCcLVNeKu
	 zo+jOJ2C8ebEQXalIubPZpLXajsJXqFrPCGP5BnWtj+0fB2+TYrGlzm2kWKx/IU1yJ0Re
	 kJFk10ZXgfzu9P66ADXGfGPctZ4SRHuGo8oY93Mge9EPvMlEBSjsXwL7POOUsNVKwgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hQD9mPgX;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86A606A321
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 17:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE86A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hQD9mPgX
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 01FF33F920
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794330166;
	bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type;
	b=hQD9mPgXugfhtIhDcvsq4SZThekNRzFT3sMIjicEtPufbY6ARxAAxLQP9WwXgY4CC
	 aR/wvfhIAOuf3xGqJZo7ygWk+aKNtZBVp7lmCnO9LJjMhM5KrxcmeB8bpIIiHRMrzY
	 PrQkHf/lANfXuOSU36xUjcvWW5YuG7yc9cPxFeqpveHCwXebfEbaeOUTnysB/U1Bfa
	 CPGExOBT+QlJol/ka/7z/wx722r0mcwCR5XGgD0Q5CsXjt2jIbL03XUfyNoMmsSoTh
	 azWcf7ngIBV/oFBaUnd03Yo25hSnHRyOScMrPajLZzJy5tRQmcPlyGJChgcodsy58N
	 FmaWQlVn+De1Ouo/qWit8uxUXwv+CoTiMTgzmtBj9+o9QGitYLGM8c7Q/jbx1Yas5Y
	 Y/48ZWEGk1Yw3ZMsowhzD+KSuKGreYgOQSxMwuhcsT8w3gjGieQ12dOUI6ZXkWpzhG
	 8sMIACnv7Y4gRSVmbu8/sq3RVbNdvF6kvTeBTqiOTSECV65jVm7E9GQMzEHXuE4I6+
	 4yxISxem7RcOd1JlrFHtBjJWAIfBc13cDpxb24Pe6pnOiyz2sJ0yOQF8Nn30Xsj4Se
	 9g6K+eeCapUKBWNEHlb7hd/cxrT1Mr+c02r8iPBVBUvKS9yvI67OBzeGZE5fHy1WgH
	 wOfMNs7ArNDVqstymZ1zmUTA=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49323e268aeso1770730f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330165; x=1794934965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
        b=kOcv5Iv9d5u/JfDwF/NcNsZAyOKSc9o2+ttedfqzgUqz8+rGHqIJrbxij7bolus0pE
         aRFySeC83Db1ncW7REEwailILQl7PJIBfuPE46N5uFkVzwA1wRCX1j/7jqpQs6rRWW/i
         ZPepP7l9BGWz3B7MOyrmWjl2Vi8Nw2mWDvUHmrxt/EZrMaix76lyZA/DA1vX6z4NnQrT
         8N0gOO8LNbiHvMZIRUAUVSF63K9rx68rPBjjO2Wt7Ax6RcgavJezccaU2tkelhZmv/xP
         bM8PfbvkMlBWqk22AIl9rLR+kj0VCIn9OHhf0RieXo9bbWBYhPYxmq03RegNR4zIGzwD
         6Y/g==
X-Forwarded-Encrypted: i=1; AL+hErFcDV3rsEDFiszaMnlreMWns7/jB8Qcwxenlsm/LBL3kI/H5RO8zI9TxDbRxqzbUv93WYstapuoXe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ukKm+QOPtAIumBaC5XKmCsOJ+ZL+K41MDFvW6zIZYZe37Ztv2
	h1URwVi6FpUZiSXUpTiy4KRsI4w/QkWoDCVRu1hYrQe3gUkAnuN1A912KzzmDU4CJogctZkY1tw
	ySmrIkySak/VrSMc0MOum2D3MDwbZyM0q+cZIE5Ur00H7yrg6IK6q9Ud1eQywgAzXeTYC6L6YRy
	TrZw==
X-Gm-Gg: AYBFou3Y/xtpnN+ZwP1b5WWE7viax9nqCxDmAIF1FexGAi5FvSFMrfwaPBlWhFvy9Id
	Bx2rRbhtJGMYCU28NquETLdZ1nwlyXHzMD5I0J5H4OFTjJVhnfm70c8xNAv96NT/RhkDop5h70G
	wFqL37+USZLfUmfpzV2O3coV02XnGBWHcGPM67mHs7CoLh94hpTHsbvNsk14Yzc7LlT05Cb0nED
	U3XrqH5towpP0uoGYfOa0e9RDujMoffFlBfoEcHpkTJkW9FNGIkvz/d8LEE0lfYJnhlkgs9LHzp
	jGOjWYz+mFJaklTKb2D5skw/qlrrfuqAzyBZgHMKkHcFaOMj/jPJIQWKuzADA+RjIvsciAuRsXD
	vGccDfwSqjolRAtdLOQR8wsnByrVMbk0+DrETd/q32HLaI3OS1EgUoxa8GCapcpXHNMUwDBvHl+
	it4QNVusflH2ubn9VF4nA8Zg6XcJK1YPIooJdO2EiAVURjWgarPIAJ
X-Received: by 2002:a05:6000:607:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49992cc6a24mr288604f8f.8.1794330165614;
        Tue, 10 Nov 2026 09:02:45 -0800 (PST)
X-Received: by 2002:a05:6000:607:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49992cc6a24mr288536f8f.8.1794330165190;
        Tue, 10 Nov 2026 09:02:45 -0800 (PST)
Received: from ?IPV6:2a01:cb19:9432:11ec::c98? (2a01cb19943211ec0000000000000c98.ipv6.abo.wanadoo.fr. [2a01:cb19:9432:11ec::c98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c83432sm5386247f8f.58.2026.11.10.09.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:02:44 -0800 (PST)
Message-ID: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
Date: Tue, 10 Nov 2026 18:02:42 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+codykang.hk.gmail.com@kernel.org
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, codykang.hk@gmail.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, docular.xu@gmail.com,
 dri-devel@lists.freedesktop.org, heylenay@4d2.org, krzk+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, me@ziyao.cc, mripard@kernel.org,
 mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, sboyd@kernel.org,
 simona@ffwll.ch, spacemit@lists.linux.dev, tzimmermann@suse.de,
 u.kleine-koenig@baylibre.com, vkoul@kernel.org
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We have incorporated this patchset into the Ubuntu kernel for display 
support on the K3 platforms.

During testing, we found an issue: the screen would display artifacts 
all over, kind of like black lines blinking.

I have implemented the following patch to fix the issue:

drm/spacemit: map scanout buffers write-combining

The K3 display controller is not DMA-coherent: the DPU fetches scanout
buffers straight from memory while fbcon and userspace write them through
a cached CPU mapping. The shmem helpers clean the buffer only once, when
the sg table is first built, so nothing flushes later CPU writes. Dirty
cache lines shadow what the DPU scans out, and erased fbcon text lingers
on screen until the lines are evicted by chance.

Add a gem_create_object() hook that sets map_wc on the shmem objects.
The K3 harts implement Svpbmt, so the CPU mapping becomes genuinely
non-cacheable and writes reach memory immediately; the one-time clean in
dma_map_sgtable() still covers the initial contents.

---
  drivers/gpu/drm/spacemit/spacemit_drm.c | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c 
b/drivers/gpu/drm/spacemit/spacemit_drm.c
index 12b2fe8b6fc99..fe354219b996d 100644
--- a/drivers/gpu/drm/spacemit/spacemit_drm.c
+++ b/drivers/gpu/drm/spacemit/spacemit_drm.c
@@ -12,6 +12,7 @@
  #include <drm/drm_fbdev_shmem.h>
  #include <linux/component.h>
  #include <linux/of_graph.h>
+#include <linux/slab.h>

  #include "spacemit_drm.h"
  #include "spacemit_crtc.h"
@@ -75,6 +76,20 @@ int spacemit_drm_mode_config_init(struct drm_device *drm)
         return 0;
  }

+static struct drm_gem_object *spacemit_gem_create_object(struct 
drm_device *drm,
+                                                        size_t size)
+{
+       struct drm_gem_shmem_object *shmem;
+
+       shmem = kzalloc_obj(*shmem);
+       if (!shmem)
+               return ERR_PTR(-ENOMEM);
+
+       shmem->map_wc = true;
+
+       return &shmem->base;
+}
+
  DEFINE_DRM_GEM_FOPS(spacemit_drm_fops);

  struct drm_driver spacemit_drm_drv = {
@@ -82,6 +97,7 @@ struct drm_driver spacemit_drm_drv = {
         .fops = &spacemit_drm_fops,

         DRM_GEM_SHMEM_DRIVER_OPS,
+       .gem_create_object = spacemit_gem_create_object,
         DRM_FBDEV_SHMEM_DRIVER_OPS,

         .name           = DRIVER_NAME,
--

I'm sending this here in the hope that it will be useful for a future 
revision.
Is there a v3 in preparation?

Thanks,

Sarah
