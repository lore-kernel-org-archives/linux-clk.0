Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8422C33BBAA
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058807; cv=none; b=ewbnRa3qOpQdAMcISMdL8IOExCPnuvDgL5N21QyrFYxFNx2v8WLAkj06ehuVxK6gBZsUzG9hd6ug5CnwSSohy6JNJlG2tdo4Bh+x948VwUKAR+MoU/mg26BzIWEXHOrL3Tv4MVfKmnCWUCPqttycQv3maDDA6oqdkePGsy9eDOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058807; c=relaxed/simple;
	bh=xRqkbISi+umRW+NW5m1DLusdaL1VaGyCiP9TEoYYzu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrcmT4T17aEC6nFtc5R8vSAJZ+k4a4O/xDtWAdnxWqTV2sruIUsfk1XiL2NOlje5H1R1qTcSbyhxlaCEcaSHLrPhPOa5EsbcdF2yuRKv9eYnKjH/3YF1JrkIJCCV4RuGlft8jPhAFdb3k34HeMfqzlvSyaeLHwPtyhLmiya+KFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzH5Gs5B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ac1yZA/A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzH5Gs5B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ac1yZA/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772058805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jv62fpZ1UWkIg2aEYGXL4EYMYbA5lJlEW/3ywaP6YOE=;
	b=PzH5Gs5BCFOHEb4tFn/Mkvtf2lWB7mSK6mU7JCSHIsiUdWAfuzgZCJTYSaC3ViFR2xfump
	kOR+ukZHzDZII0ydnWu/KZezrW38uUUMtrZGR/7KTLnnX7FZHOXM31fWtSYHoRX9xl5ntC
	66oEb0vexCPUQxnFROFE94nRzpM2Ot4=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-W6LxEnHZNDCas5vwkJ2OVQ-1; Wed, 25 Feb 2026 17:33:22 -0500
X-MC-Unique: W6LxEnHZNDCas5vwkJ2OVQ-1
X-Mimecast-MFC-AGG-ID: W6LxEnHZNDCas5vwkJ2OVQ_1772058802
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-64ad741539aso231945d50.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 14:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772058802; x=1772663602; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jv62fpZ1UWkIg2aEYGXL4EYMYbA5lJlEW/3ywaP6YOE=;
        b=ac1yZA/ASv//zR3yTnQLnhbtc6qruEGz05/PPVFi901AWkJW6v38a2cZezy8q2t7v2
         Ng9fgSHxL1oE46aiW/saVJ8OnIr8N45mwGQVOzvo3M5XMxvGUbOqCyZL5zU+vlLaHuTJ
         RqknYKpmNlJlpVpm6tE0FJbkF57CvmFNT/bSDaUGegdK98vsOy8oxR956Yf64II+ZPke
         sUh8yipHQVNH1Hyib6Q4TRWlwjcxvOwY+Spwf+wMxMmGlge7Il6ue5Bg2Nr920scr3Jc
         dTtSyCh5lBHyFAXbgqTlK2/X6Cq4T7gOZFzBemsk3evEljAcp1kzF5chyucyrlXYhW4A
         fiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772058802; x=1772663602;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jv62fpZ1UWkIg2aEYGXL4EYMYbA5lJlEW/3ywaP6YOE=;
        b=s1Jz8nemESY+gYqfd11fN0St6/gdswIdKX1IzcDbeIGW1k7C//iCwKFKBGW8oi+BBj
         BCDiFpiNYYi8IvNwx8B0bivjm/j6F8+s9irbO0nTVbrlTRCt+DvPZfyKB/PWYYvS4REv
         gOeiZQ/TtpOnxboYpGZXLEESp9ASG/Uuwp6LuefJ56JX0zPAs63L1GyBOErzJShOKOUV
         EnQkdpGVNw7XryTvtW6bNKohxPemNX1KACnUe9AtY+HL1/u3kShv7q3cjQLUxL7Q5lDt
         YKCVQetILv3bJKO2v5OOHm3/RqTLnjqtqfZRk+i/Q43hMN8Q68zQP80sap92lpZqRm/y
         q54A==
X-Gm-Message-State: AOJu0YzTPxa6J/1WJ36DIJQCD8iSnM+vmi9RgxJzApzJGlMiJr4/QBd3
	WS62PSJEy6cBdwFL6CcFD7ZQvFpi6EDVwh3EyS0c8NOztWv5/2VsOjf8Y9Ok8/ROed6WpTw1QKx
	xp/ZXJ1qHtwSTehXoRriyLfDbcCprgsYkha5fu/uD02HY0kpkga7oeyoSl9G5RQ==
X-Gm-Gg: ATEYQzxuDZKYl++ZliGjUu+DFks/R4SMc94bdde0Fgw8ULxx7IIjXOE0kYV4dXZFfAa
	UW4hqIuvDZloyB3anwI/o6gWdvcth4Q/69T85Qc2O3BsWEtjIWqdHRpn4laltWEpZsZsocm4UUZ
	zvH5iSo2dZISx9qMvW++Tqs0OAtkDdYLSBGIr+8wXc0NcLNW4UPCudSE9iPkp0qZEKklq1PjLNI
	rFK9QD2Eaec/FesTof4dkWvkV5lbs6OVHHEPtP2uyXO200Myqi1ta+DxvRLpwjnGfTdZTely+NI
	R+RMPtjdXdlunxNchAP2qucevauUvUJBLfpJ4C//ooLDXOr5mSNAwmVaA7R4b243pqdMZeBlHAB
	/CxiuMgjFQ3DT40ki+YY=
X-Received: by 2002:a05:690e:d43:b0:64a:d20a:2e98 with SMTP id 956f58d0204a3-64cb7c0be51mr195024d50.16.1772058801802;
        Wed, 25 Feb 2026 14:33:21 -0800 (PST)
X-Received: by 2002:a05:690e:d43:b0:64a:d20a:2e98 with SMTP id 956f58d0204a3-64cb7c0be51mr195013d50.16.1772058801456;
        Wed, 25 Feb 2026 14:33:21 -0800 (PST)
Received: from redhat.com ([2600:382:811f:bb35:ae9a:1ac7:e1d:86ce])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7640dfcsm165578d50.18.2026.02.25.14.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:33:20 -0800 (PST)
Date: Wed, 25 Feb 2026 17:33:18 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/3] clk: x86: lpss-atom: Use temporary variable for
 struct device
Message-ID: <aZ94rqZqi228_pUX@redhat.com>
References: <20260224121159.3503754-1-andriy.shevchenko@linux.intel.com>
 <20260224121159.3503754-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224121159.3503754-3-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Feb 24, 2026 at 01:09:21PM +0100, Andy Shevchenko wrote:
> Use temporary variable for struct device to make code neater.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

