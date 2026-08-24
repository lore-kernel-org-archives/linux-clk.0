Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328613F6C46
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585033; cv=none; b=Xod0O4i8QEumjBGD4bRy/xqm3tTqMRvUH2aU8sjw/Ike2MMQSydqS0kGaYZCOiNfdYAo7UsnywGNxIJEQjkark/wwpIrutpfCh4VOVsltAp/R9QWUVGu3ogabe/CxRG69I/luUsjGl3BbPxLa7CLEPyblxRGsxOE0z7pn6Q8NvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585033; c=relaxed/simple;
	bh=givhnFyB1agidfZMEEQSCMNkLgs2b5ySZZo9r6BN08w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7Sw1W8X/uVZpQ2+FQTzBYL+1W1406CpxMwEAZI3DyMC1A4vofY8B+32lAtIsT+rSLzTKGnWOb5nlMoMIq60iPFt77iP+fZhPUmDdw6HrVQJAjzI1aKehMv26fkf+Zs57KhpBJlLGmWxSo0VR5VkA1kV+kOo6ixRN+2ain33geE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNaDyQCS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MxbymA9s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNaDyQCS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MxbymA9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3RhcvzE2LDgfcbnY3j5KII1AB4sSFJ69Dx82UdW9TY=;
	b=gNaDyQCSW5ykouUbpx4AyA1WP66K+tHrIKCd/vF9FQt+KSuE57i6k4B8b/TjD9fPjSgexV
	Z9fpPcprXvI256pGPU9wh3ksIuG7JVfavC8stHhYZVU+MGU7g6lc4WT+wHZzrMV5V6+Lmb
	+KzvTs/aiiDgq39hpX1T0q5UK4337FQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-kGmVORtkPiuoJbBfW5fnzA-1; Mon, 24 Aug 2026 11:23:50 -0400
X-MC-Unique: kGmVORtkPiuoJbBfW5fnzA-1
X-Mimecast-MFC-AGG-ID: kGmVORtkPiuoJbBfW5fnzA_1787585029
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so469791585a.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787585029; x=1788189829; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t3RhcvzE2LDgfcbnY3j5KII1AB4sSFJ69Dx82UdW9TY=;
        b=MxbymA9suMUU8yvRM6olM2+O/8XJwxG5pEnGUjvFsqdEJ1uBqWrutDAxFtuNHV66W+
         mGIyQS8RVSSIyCr5VzJZ1g5MUn8DT83W1Fdl/fXkMBqpk9SCquzUaZjbQDNzmNipUim2
         xryVVxun+xftBY6oJRGeK+vEp/AkO+XHdwxyckrEgVo3XI9bTRANBFB2yWGZtEDVMUcJ
         sxFhIb86obItbDqlB11E+mbrcdugSnjh+HzVFYAuCeL+1b6DaDfQOkjZTIv77asS55VN
         6pLHZP18tgu85SZS79kHjKoH6qpuu7zdaDvf9kYYkn6/WG+M1nu+9WdocEzeJFd2Mgtn
         usvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585029; x=1788189829;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3RhcvzE2LDgfcbnY3j5KII1AB4sSFJ69Dx82UdW9TY=;
        b=PhY9W/bPCsYuO8Bu1vPiCYXHPIoN/ubfGJuu2AiGHpm5da/7BlthDyqiVW9WN0fgdf
         64Bn2yIcghaQ4u2UgwajVAgD80nDvggkpPwhz63cpii1tb6fPcHFuq1FWT20iGvORlxF
         +yDFVq+8CEa0TNfr+JURWdGGKb3Yv323aVQhlBfd170Gg5LPrLMBiV5ncPWK5nX32fs0
         y9p+RYIoR7JqGq9tOScm6g6x9QU6dyVqQa0zHOgooRkJue/d3I/7DExJtdfMJjZELz+y
         XGvIcM8+p4QzQtAIPPsveRI27ed4xKiidJI8dVKdlER3oXutPOx02Dt6PSTN56/7wrvn
         Jg4w==
X-Forwarded-Encrypted: i=1; AHgh+RqU7dZ/eEEDJryRUmafbP5irG9oZwbhHBBdmQ1gELMU18ZLSXYqYAcc+Gurfv7OrzDfN4zmd1wcURM=@vger.kernel.org
X-Gm-Message-State: AFuF++mQM/XYLbWkwuTSGXiLpyguaw4YNixS4Pb2Zte9lhoOmwp394Qk
	et47xryVOpv51kmRWOJPVkF2SJrY1KS0Q2DSCJLXC0Fh33z0C1rpeiRaScCLIXZYHaYmh3gu652
	/9cmQIVWS8Jfv6vJH6EgW9WTu1+7hvQWISgkIkbx3OqmEDwpeJd/OOpLQhSDIQA==
X-Gm-Gg: AR+sD11z1ENXK3OBLbO8seDbZbkuG8L6/Cbtefh3YeLWfiDmzTp10eb9QEy3CaTvG/5
	uAB5c3IKk7HNZEalNS7F8vX4y6mBPiCwit3NJefQpH9NIxXOiGbID02d4xGJt+npBd5+8VW/BtQ
	KOaBPTkxFWzU5UUpIgn/8W7P0m+Gee7Yvc28jG7Ob6o5ArdbOaOo2ah3gAICl+CblXP6sclZLPF
	zQreI/OSbHX066SmftmFRXLmUG5r5/y++Sd5gbbRms7wWoLr6pUWVt0sSHayAcWuJsHeipqoy6S
	8CLuLIZu482U8GDLea7Hjsww+Xy6JIWtJp6Paim8GYjQYxDBXNGXjvPUDNIKMreLN7CjRcHQPhp
	lLVHKdvQwfZVlUs4ggy6Wt/9lxcyP2CB/pNs=
X-Received: by 2002:a05:620a:410b:b0:918:7e9e:de74 with SMTP id af79cd13be357-93728511a13mr3206788285a.17.1787585029379;
        Mon, 24 Aug 2026 08:23:49 -0700 (PDT)
X-Received: by 2002:a05:620a:410b:b0:918:7e9e:de74 with SMTP id af79cd13be357-93728511a13mr3206778885a.17.1787585028700;
        Mon, 24 Aug 2026 08:23:48 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749ae390esm523684385a.16.2026.08.24.08.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:23:48 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/2] phy: Make sure clk_init_data is fully initialized
Message-ID: <aoxiAyoETWEZ1bue@redhat.com>
References: <cover.1787240165.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787240165.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:08:38PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the PHY subpart of Part Two, which fixes remaining cases
> that are currently harmless.  These are still fragile, and may cause
> future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>

