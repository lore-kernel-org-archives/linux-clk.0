Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299CD435502
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222742; cv=none; b=TGwLA5RZBfc10Q3LiUmcMH+zs9Zp0TZ96jV+2y1aoG3HLYb8ZMCe9CdIuVwz7aizGiK1s5kOb10AlrYthdWR25Nm4nL3IREdq/XEJ7XCZjZcu3qC2OR1WbFk5nxsSa0qy31tjLoYyzwnYgvFr39d6TO1EuhVSZnuuXNxMmCW9Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222742; c=relaxed/simple;
	bh=2TQ8lYG3jRnK4XF/B/rdIFu5UZ4GdeaVlr2XIUAp+qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARhXse0R4D62MXhG0xe/dbbDrRpEqrJWZJRFcUuKOnTxtqGv5gDrikUpZ7eodoJmeMQyI8KWgv6k3e+cq1XpAOV4dKVDe8prTKQSPiH/nzW+tuHOs3feGyosjIS7P3u9LuBZVSoPzSgKwWoJ8cxI5cfZ6VcCLds4YSF2hxai3WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FmlQKI7J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=J0KJDc+g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FmlQKI7J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="J0KJDc+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784222738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=scCDZBRmaectbqPLUAli2y4gjtgYwJtAiuNHQJsK9HY=;
	b=FmlQKI7JKltwasPmWhnkFQleiyKLZtTcX7DPQXPMwe1OXAxdsoOtJ1U3vyZUuSuG1xLUZC
	knt/2Zv2pUIyFZE7CaCG1ETFgPG5tI3A56fm8cRjqppSeGEXq9EpCH09QqDMczE0I0WsSY
	6c04B6g51Jjjg0Lkn+1XjyH4bttbVTQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-bpqfYOfmNyajRNunfI86Lg-1; Thu, 16 Jul 2026 13:25:37 -0400
X-MC-Unique: bpqfYOfmNyajRNunfI86Lg-1
X-Mimecast-MFC-AGG-ID: bpqfYOfmNyajRNunfI86Lg_1784222736
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8efad04d884so68419286d6.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784222736; x=1784827536; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=scCDZBRmaectbqPLUAli2y4gjtgYwJtAiuNHQJsK9HY=;
        b=J0KJDc+gZk8QRwCoZRmo7mR/chWvVR4npnBtCA2vvZbOH1jE/K5X6pjIQuhZjg5iDR
         UZpB8diyXPWvXYXXIzcCCSpUsFkSzdX44wg/HSJvIFIelYUoQ6C5BZfjP7HlZLIMS0qa
         p8+WUDiWYPaVOlNdMeqpPlMCvyo+gHv4MK9kjQbU61k9+XQS3hds9c7WauHfuQTjKhkI
         qnbQMDJmaGlxoKCAmWg4UmwA1rDBvyS7LHdhpkRhsO3GN6Ez+5bQubsu5CanQ9wOT/yj
         1qBWal/bJeRSILSO4XQGLxMJufITWK1H4aBC0AaiUrFZc/VtRCo0yqLyf9wD+1ykQtZP
         u4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222736; x=1784827536;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scCDZBRmaectbqPLUAli2y4gjtgYwJtAiuNHQJsK9HY=;
        b=HTt+quPMUKHI7RO2xAnTQQl3IBZSDguhpf4gJNwF79RaKXph1yUfVp4y1zNuhLqfVf
         mYZiU7H4oCcK7kKBh9F72GFywr1Kop5EEq96noN20/moxnh51aLHneBBN+F95Ez63vgg
         ZJTScB66yc35VCTg/vl7jpsH8EhxXptH0r1PHXsJJ8HUJTZgCfZSIUYeDpZjrCVAHyrC
         OWCiG7sKfHNxoP5I5URUVQB4lrrPy8Y0G14ibv4B6clzcB9V7kdQFSPlqsusBOCud7gO
         oR5csFixc1EZ5foG82z6GsJvse/A0GD2h2dsxAMuDq45GQg0GLd5lfV2m4G7hNmpHiIy
         aY5w==
X-Forwarded-Encrypted: i=1; AHgh+Ro7u0KoC6oBXWu79/DWbu8KHrBRd6noJByVFzFFPzFd+11G6IkmcwIrwaXH675sICmLy7Sz3TSP6LM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/gq+63zS8KUxc2RwKL9Ojwzldrl/SRWrHPynE5hPh8U6LA0i5
	lQkEG3SsX6mkxrrbA0q30Z6MqvDo1ZGyoPRF+KrBHxIHnUBYiVAcbjHUfNkxNWIi24lPnCQyUYk
	87c0yd7hko7+yajfsjf7j6VVTr0/Osd1UgiRPUYnp2PPIjpNsz3HARo53qNA5hw==
X-Gm-Gg: AfdE7cnugr+aaSPdcEJqVqRQgLXXXSQp6IObAol6eS3bbHiNsSoem975rg59BnYFY6C
	w/A8nNmBc48edzRY2lUOgEJp9Sdnpp+64r61rWf1aIPt88PU5BJ2hggMhJTiOhRBLA3yVFXjUeV
	UgAi/pPxTBDPjAK2wG4IwqLMKoA2p8BN/4NQrtzcpooJbs5NpcTG0XuhVYfkMjxLaar/FvyzXF9
	31FGxU11Dw4RzP3eCzc6WKRC28m+HjJHxBjiBJG6u+wkF8ieAidLwlqYlfVMH38wFCpSbtrcIFu
	LkZeExrlWoOTbkjU8Lx4PqMYm9PwKKRsKNbNWmrMUo8qpIPd2ekW0xMVMPUhaT372pexEKaz4Yw
	Ov/GJHK1HagfnJ9agQ8pRAmJ3UMUpNzDS7vI=
X-Received: by 2002:a05:6214:4990:b0:8ee:88fc:e0ba with SMTP id 6a1803df08f44-90774333837mr6712146d6.6.1784222736203;
        Thu, 16 Jul 2026 10:25:36 -0700 (PDT)
X-Received: by 2002:a05:6214:4990:b0:8ee:88fc:e0ba with SMTP id 6a1803df08f44-90774333837mr6711676d6.6.1784222735673;
        Thu, 16 Jul 2026 10:25:35 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d8fcsm226578126d6.25.2026.07.16.10.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:25:35 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:25:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v3 2/2] clk: palmas: Use devm_of_clk_add_hw_provider()
Message-ID: <alkUCtKODLYwEy9V@redhat.com>
References: <20260711141755.96842-1-mhun512@gmail.com>
 <20260711141755.96842-2-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711141755.96842-2-mhun512@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Jul 11, 2026 at 11:17:43PM +0900, Myeonghun Pak wrote:
> Use devm_of_clk_add_hw_provider() to register the clock provider so its
> lifetime is tied to the device. This removes the need for a remove callback
> that only unregisters the provider.
> 
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

