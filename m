Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1866930AABE
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435713; cv=none; b=MrKYUm9EkALB1QkSE0oShob2yblAlG0CuBP2gPRpWVUdtoKVsGJiAJ8Pj2YZ3cL5a9O3Kpb0yne9SIH9geUo16W69jKPrwUgfQH/9FW+qeWPV/2PjooA61MT0KOIMwAH+LN7uUpx2npi1MrumXfmoIfn4Rq7AXgzek0aIFFa4LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435713; c=relaxed/simple;
	bh=Lsg4j5eFWvMqIbEJyOW2qo0hHFj3gbtonhvxLCJ8LwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kqc8cpYC76k+wqeXelscbb+pYDDBAQN5P0v8GxcrWs7uLXWuy3Zq8eX8ICDiT2xEq+Viq/tpD6N6VRieZygaWYtfSc+9AQ4idLecMAqMNqrxBasqYOFpA2jqGop6rU76FHQ4GxHnYH7CSrKI/fgdieloH7QNO+dtfcPAiQw4Rrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VzD1POnF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k3aXMXrc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VzD1POnF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k3aXMXrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783435711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=;
	b=VzD1POnFW5OZi8ODFPNLGnViaYsF89+MagFD1VEbFRnm79+NNCvMvwCpduddj1s/wqeiHG
	bGEZK3c2LBkKjTUsPZQiqUfNQvNu6rLtK6Y0nXsQZ+cEuvzHFOkxOhuCRssmcETU8Yqcud
	uFTfeDi3n1BvDqrDPUpzRmD96L5hngM=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-2Arf9V-kNPSXuwfWiZbRGA-1; Tue, 07 Jul 2026 10:48:29 -0400
X-MC-Unique: 2Arf9V-kNPSXuwfWiZbRGA-1
X-Mimecast-MFC-AGG-ID: 2Arf9V-kNPSXuwfWiZbRGA_1783435709
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb6a8c61deso3551269a34.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783435709; x=1784040509; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=;
        b=k3aXMXrcd/shAsPRWPpcdGae/nQjSwSmaydE+WDllEByadAYGT4Dy1Yg2E1umcVJrw
         QQNYX120gHCGKheqHv0UIQNnSHbssuWk0Ie//3ckv6e+5W2IlxkpDoka3B11HCkTcjtZ
         q/4vR4Xz5pb7aKoWcxIg8ozeZ754DbCm5mZlKb3zoYdiYBGauRsOL+QDDT/WMWBYSr1T
         GuBwLJaXdytTq5x4rsf9psh4l82bHL2jZV2JXDTB5F9LRxM9RDuissuh4/Ta+4jdW431
         ShkwGZgrEoSWDjrj0sUS9Nlz/G1Yokfg6/sc7TelhUbf8Qve8Rsbdw4CX1foe5srC291
         uLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435709; x=1784040509;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Drq9IO910KDKJg6IREG7IQQKNNio5SvfjReuxq/0qk0=;
        b=pEDdhZJvO55Rxr9PywvSvZcVrcGLxYP8tRTRiJH+9HsBI9P/sQ3JAT6bkZO6iatuOx
         vlj0ucvhdQzkXzI6Yr4vd2j1gDBje5CgV+r8hsJaWXH0Ad+dw1QBt3zsNehSKDU8LfyX
         IkgGWCi42b0GqdBmrNVo22fMOQOYAZQL80KRBu3BuzgMnii0O2F2rtr7eZhY5dqRUNeu
         m1ixTryUGgj5o7fJymGOepOBeYL4pU2DCkwvQknnY+1Tv41tWPXFlTpMlMwuGghgZk0e
         9Ns/tgkPbG1xXSBp9qZJyMo5fri/34XKjYJ94dsfTN1XumpYbKwpIDZTHAbGRQImfT/r
         hl1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8hHkJL7m3Kjv67vy5wO221WNN/gUsMRyh/OTDkDta+BYR8OF4eNuiIz6uLN2WEcATdzgsQW7A6rAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHhQmLWvD7YfkwZFbsMz5IFdjhwkD8iEfUlUJndmWOw7JzDfHW
	AGAIbawUr+N1RdUlLwQ42dkEyI42ClCk1fXWjkLyXSDUUC+Qu7YBCsI4KQ3VLivlN93u0YUaFaP
	hgJWA2m+PF/PzS9XDWi141MmfoRCQzXzmYc9BS/9pE2HvS3crT756NusUwtkiRQ==
X-Gm-Gg: AfdE7clhkmi00xwbk2ZFi1QSIvtdOi7EhXb2YEwgBP0ER6PJyQZ/wQ+4eSYrQMp/68L
	nTGRVHBxF8HWqzqTW63ZjrCTP8XOzFxEVJKIeD8zONnDV6g6iM4CfrP/R6aoTegcavSywwOWEyf
	NI9SNLsRzVUrbY4C5fPk0C48tNVLL7Zkwgox85VJPBy9JchWsjZ02/EK2V5MY3N0bfdSSDwEO7a
	Y/KZ58QSkfXpmfqV7sRuYHoKbBaz7BtYNjnctoXW3XVIEtnezYJ3ktQEo+T2zchdzUNXu+jqrI1
	YNDbh+1xhrTn5nSuTqgVi57ZuX8aYLQYVETFxUZJcj8a2n0L1gxHmqnrgUUNuFIRFIYJo/qL7xH
	9B8fhw9ay
X-Received: by 2002:a05:6830:660a:b0:7e9:f0e6:fd55 with SMTP id 46e09a7af769-7ebb239d6a4mr3693043a34.30.1783435708885;
        Tue, 07 Jul 2026 07:48:28 -0700 (PDT)
X-Received: by 2002:a05:6830:660a:b0:7e9:f0e6:fd55 with SMTP id 46e09a7af769-7ebb239d6a4mr3693021a34.30.1783435708164;
        Tue, 07 Jul 2026 07:48:28 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542936e6sm14104096a34.5.2026.07.07.07.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:48:27 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <ak0RuP-Gy29fpPVi@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707074839.240676-6-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> platform_set_drvdata() during their driver probe callback,
> but their remove callback calls platform_get_drvdata().
> This results in platform_get_drvdata() returning NULL,
> which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> This leaves clk_data unreleased, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

