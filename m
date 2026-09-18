Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0763128CC
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769461; cv=none; b=SRps7PU7KzW8elhqNr6yrUm/pgXWxIvmTBxSFbSukMaVouOzNMXVy70Ev+xLeAkmPKsmN/fOGJdaWBQ8VUiNI5zXINiFiHS4Q+rbEwsX5Hz2tX9U6QznjNQqoyE48NnrFjUhrz/3g2SQI/VNqPouosIvbXPB//Uww/WxQonmHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769461; c=relaxed/simple;
	bh=3BOXORGhjvKc95XHAynr/FfzhVGUWPu4pKKPBTwa/a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBoozpDARJOiW4OBXUIYAtoE36JIxQXxsyDCDaeIcdT+sxdvlMu0Zrpv3LnOOrmwn8gS5MacRv3ku96cW7KdGpYgPGe+mTYZcEe5+USMSZP1ED5+ygM7+N5UoDRoVkUQoXe2wR0xnUM28H8iUGC5aqfzW8eWFFo8v2IZ4CBoiF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KfyJ67x1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CfbaNuJb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KfyJ67x1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CfbaNuJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789769458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=;
	b=KfyJ67x1t5JCFrmdBE0fFLWzHMUhaOevQtrmohCiq/y7ovkN+krph0cQn6C8SC91jyu81g
	VevInWgYWubjEGBFekkguJx+t3/PsZmVIoU5a1ZnRfHkQOT9JUbXRPAzDeWatCKY4hDzQ4
	91ziufpSFoNlmbYqJdUwfGIrrw9zmwc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-xU7obAtFMF-PiA0Oa-oTOQ-1; Fri, 18 Sep 2026 18:10:57 -0400
X-MC-Unique: xU7obAtFMF-PiA0Oa-oTOQ-1
X-Mimecast-MFC-AGG-ID: xU7obAtFMF-PiA0Oa-oTOQ_1789769457
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9123c523d0cso16259486d6.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789769457; x=1790374257; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=;
        b=CfbaNuJbRrpwpupg5bCF5v/Qy+nK3ps0GnCyWBvWwQ9W/IfcrbF+ydG7gbDy+GvK2E
         nlwe4nvayHr3VJR8MFg5NuF0qlPxvSpnaMYPURvP8jtE882wVuHtGRYHg7JAcHV1xv1X
         dSIZuKfM4BqNcXjjMxT0F7+avmuOuz+XN8bHFxg7qZWfXjhjGy2mYdCVbeT+M5SJPwY4
         ZDcJnva5EE2AMwpfg/xHoJUfMq/HeSwRYn69LCutdHTy24+pMAM2odavMn8XdegDgDLV
         iR5mLnlm2OxcjMXgJ0tBl776/rKu2lKrgPuYrZDXER1A8vJn/nRmrpU1oKaQGn/55cyS
         xFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769457; x=1790374257;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLNrY4Ytq0dMrB1VfL87chfCfh58W/MUkHbrk9QqLWs=;
        b=TETjNbDRABKldyTeDG81KNdQV581XdVCTRAZUmp86Aa1visrqgc77/+UU4iZWD0IFg
         3UeggwpoU1rO3vrJvnwA0FVeRg6I0RGC/WAg1vjvylyZiNFS79KEhtfcRQweuwtyskrU
         jS3nrGhpDWu3POBmVfk5qXRNimVZ0z62E3qmRJ4w+pHGHGwjUhO1UtFOzpDMy82QHTe6
         q9ViERqyef6xWcubj0J5hiAPnGbBCRlc446SKSXng7AJzzJn47rt4OR8BDWfuoaPNsK+
         1n/gOkrhK6ECils7ZAdZRk+GB/cO4eiy8QpiPimlILUUmqY9BgcUsVv57Mro12DZDaV/
         J6Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwRjEh5ykuTWBRxpEfPpyjAE9/RLXnpPZutJnI/vl1Vbpuzhbg83oNHMiroNMrsGJxP4DkAE9gnozc=@vger.kernel.org
X-Gm-Message-State: AFuF++l5VRP/Ce9zdbgzgqDDhgPFDSIBRfxaXFbqmwKftywO0GrLgFtT
	PfnvSMQmv2VK+i6osrZltkYKRf/9lrChELkkpyUG4JjOF5oodW2ZaPghJejm0VGlvzif756MMEM
	c0DN1Lsx9wtVvg+lVZe8nxCFLmA8hw80MSjsXa9lYaF3lc3SFjAHVu6vwf1jIww==
X-Gm-Gg: AYBFou0Gcnoi+eH5hUgD4zwJcrww3FONOT91YkBPavmLxQfVZjEtZfhHJaRSJdKlIri
	0uy/503gQ4s67GutxNNBqLpUMlVvVTMzksRRylmS9JcIlUsHpsk+UIQKiAe0oxPPjQQ0357LVbK
	1yl3/V/4BqgiXkefCph0hQ2XUpLaBjKFfuUKG1ytjHLu9r20rQp/momZTJ6V4N3vHvgRq7E+vdz
	0hp6I/HwkACy7chZk/TOp+8gNRzv2XpadLwTZG0cAlatOEPKzdwHA5hLOpS6PB/X1aB+N7ALNsc
	T908JI0bT1cTAHlp6pvqwkrvtRbb+ysBiyuQGULedplSe0XuNAI9mSnvD6W3CGyjIXBjHP0=
X-Received: by 2002:a05:6214:2b0c:b0:912:5fe2:86ae with SMTP id 6a1803df08f44-9125fe288e0mr25091996d6.5.1789769456846;
        Fri, 18 Sep 2026 15:10:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2b0c:b0:912:5fe2:86ae with SMTP id 6a1803df08f44-9125fe288e0mr25091386d6.5.1789769456370;
        Fri, 18 Sep 2026 15:10:56 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260967307sm6178666d6.6.2026.09.18.15.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:10:54 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:10:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, mcanal@igalia.com,
	wahrenst@gmx.net, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: raspberrypi: Handle cpufreq device registration
 failure
Message-ID: <aq227UOtx6XMa2My@redhat.com>
References: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918044131.608482-1-triet.hoang.dev@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Sep 18, 2026 at 11:41:30AM +0700, Triet Hoang wrote:
> Check the return value of platform_device_register_data() when
> registering the raspberrypi-cpufreq device and propagate the error
> if registration fails.
> 
> This prevents the clock driver from reporting a successful probe
> when the cpufreq device could not be registered.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>

Fixes: e2bb18347c8e5 ("clk: raspberrypi: register platform device for raspberrypi-cpufreq")

