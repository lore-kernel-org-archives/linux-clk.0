Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E734DB4F
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227256; cv=none; b=TFylnlvCsjoUCfSSMbiHmVtLS8bfC0LOns25U5HciWw+/tJjBHbKVbJFKQFgoAmyhZFyCHI5TekpFZ/Gsm91UN2hwV8Ho1uyzXgf/Yvvrsik5o8CaptgPUvPBkg9Aj9x916HFQpOzelQ9klNbUyberoiANp0KlFylrHs/3h9FjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227256; c=relaxed/simple;
	bh=KR2lS0bJIllIDJJuumGn/2W7QLauULetuvssl/QgRro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9qK6gGiWbB5yGxKyTlP0/iIjiZLk50KFxQuRLxz+xrL4yir2xjhCm3/nnl27vhl/mYrTMsEQcY/nYod3uStQlJW2CD3c+Wj5g3E0k3MfMN6PV8sSkYR7vaEoR28cVJDVgXI1kClW10TRoRFfLTtuJOq39+lkys+8aBY6XmLq6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=InhUhAwS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kdy4Gi0V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="InhUhAwS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kdy4Gi0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775227254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=;
	b=InhUhAwSdkCgNJJwjsmTykbsuxKBTMwk9yPYpxp4L0EceKWOIMiQAdoZUMqNdAwJxO1nvy
	rHfhoH9Nnd8AQ8ewBfSpxfwDAfztvStXwUL+LAnqeIaApNXMhxQmWZN9QcQMGNK0xNMcNb
	X+qBGr0nFu2JdyHW8PvsDKkBT6UrAIE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-RKePBHpkP82mjpgAbhT-3A-1; Fri, 03 Apr 2026 10:40:53 -0400
X-MC-Unique: RKePBHpkP82mjpgAbhT-3A-1
X-Mimecast-MFC-AGG-ID: RKePBHpkP82mjpgAbhT-3A_1775227252
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfbfac0e05so510199885a.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775227252; x=1775832052; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=;
        b=kdy4Gi0V1uqPAaPOLUEipzE8FjGqydgT0EyHXEF47xWwr2cCnRLsJZkjlmt+iC30Zc
         dx1+S1DRL2LxMMia6vIoYv/CZS3VFQvDM6L6PQr9qn3tzAuNma//PT6rbNizfJoIdEs1
         jd4y5o6Kho7Wbj2MvbReQQluLS90NWb3tPkgjb7TQfYODHLi5991uuv7GlZ5pLRaY4l7
         8aLqgn0Eh+AtG0ItygVPqybGL9H2pPXU8nEaWEcQ3EJZT1A2KF1gu+8NkbEjd8KpWLdB
         HHQ0YvVkedMobCY54APLKRTAU3BDNrS9fMgMY57ojbkexwz1kqRRDJvgO4+J2Co0+eP9
         dqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227252; x=1775832052;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=;
        b=E+S+zzlutEfCVhZjgEnMLFGnl4Am89xW5B0gp2dKIlHXJGOWYyyVVGWWS8B2UuLMEC
         hBF4d0HhSNbJYPKSl5doN4WEyKEYaz++P4p18DAPeJ2neMWvwI/ymwFSRNDncc9p12uy
         pk/usKKprB2YGJivn7uQl5b//pm1qem26DFL7TJDjTikLNdQEJjjlPMuQt7l+dRHngHh
         57WJDssS6UxGU09WhfEgE5ldNR/InQzmFEAjxJojhDo9FVkQEfHP/xXX6D+9rJvUDilu
         euPWjTlod3gps17NYpv7xAnHn6MSevpRK0ItAalSvkN01iH94fZ5VnQYjcPmdCnMVZSg
         XIDA==
X-Forwarded-Encrypted: i=1; AJvYcCWtcf0lRpoqB9WbFXqYq5adlUbBeTyuvk0/8iRCAvj3YmUtgKgbSSxLDG5qq42x6q9icN4YAiE1zgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHaXBKSZDx2Q43gzP762XLF6R0TbcfC1cSih2oihZXjderxean
	o8DXlAmw2BbUfbMdOIhTC63vMqyLk9SNUe8i/paoIFnPan/kHF4kLuB882bC6pKCltsDklhZkVi
	JU1l0UY+KSscCij2SUypNEKgPkdImGd/8E10/KegbI14Jj1s165ELSbh8re25lQ==
X-Gm-Gg: ATEYQzzK3w1HX4/0uwprmsIw/2J75M0gpcizJjeQjTuZo99hhdQ01M9cRfqR1l264Jt
	d0o00TUTuL/nodNN5du/UL0oiYba+Ohx16mPcxY25I5DMqNKHXdGvcoK3u7UO4sujfKdfnTZvLY
	F6CIoyYeNDdQkJcuuYrBtAm2uiLIp/lMsFaGV+a90FoR1GXMjtm+UWX5vnTLDG74TECDTCRShm6
	mi616wT8PPPtPAN2OjqQBHPb0cDYF3AHmPANK/5/YrO3VQk5K2YfzkVIFjM9eqiIHDI3OqZoVWG
	2kgryB1zrbwGOgHQ5SM9N5wb9Nd0/VXz10dzrhRB3VmT/6UPbhUL0/cg2KRoTVJR+XH7IqeV1Qo
	krxHdv0C0n/Ai5iHbahPsDWAh62DreC/0Cc5QDcScknSHg2cC9NNQugLv
X-Received: by 2002:a05:620a:294f:b0:8cd:918e:e824 with SMTP id af79cd13be357-8d3042ce0cdmr791438385a.42.1775227251581;
        Fri, 03 Apr 2026 07:40:51 -0700 (PDT)
X-Received: by 2002:a05:620a:294f:b0:8cd:918e:e824 with SMTP id af79cd13be357-8d3042ce0cdmr791435285a.42.1775227251080;
        Fri, 03 Apr 2026 07:40:51 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593bf2769sm50504626d6.14.2026.04.03.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:40:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:40:48 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 05/10] clk: realtek: Add support for gate clock
Message-ID: <ac_RcGSpVBpt3S7C@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-6-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-6-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:52PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> disable_unused for standard regmap gate clocks.

disable_unused is not implemented below.

> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> ---
>  drivers/clk/realtek/Makefile          |  2 +
>  drivers/clk/realtek/clk-regmap-gate.c | 69 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index a89ad77993e9..74375f8127ac 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,5 +2,7 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += common.o
> +
>  clk-rtk-y += clk-pll.o
> +clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> new file mode 100644
> index 000000000000..8738d6c6f8dd
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <linux/bits.h>
> +#include "clk-regmap-gate.h"
> +#include <linux/clk-provider.h>

linux/clk-provider.h needs to be included before clk-regmap-gate.h.

Also Sashiko reports that linux/export.h should also be included.
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

Brian

