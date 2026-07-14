Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41A444717
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038679; cv=none; b=ZR4d0Kd3t+HjEY939Iw4qTSR+IlXVTSird9V9dcSrCcudlzPkjSMkB6EKVHodnkTzhqeYOb+/Xsz2qOeIfXc9X7UoQftpJeth5wdaZ1hIMAbVLn8o4nk04DhsIzz9NU7oxlKosZgKMgKuwuoS7yvpWbF5a4+tClejfB10a6ptTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038679; c=relaxed/simple;
	bh=NmVoz6joegwYe9CdRnyLHDSMMl4NxXUK4NpBnsbb4q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR6xJQtAti8nzbyd8Vi7VtQTCWuDdt5Pq7b3GGcwDJEsyqjtxIlI54unk+crf4/sXlJW6Gbmbm2F05s49yCiv3QT1NPJP24ewdy3obHUZN970UAJCj+EOUNaD9d2j5FETlrcGdovaNH4UePp6aWkohueSAGoCRI974rOeBSBfns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S/P7mupU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BmSaWELW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S/P7mupU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BmSaWELW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784038676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vGE7ci+ke1IPkdZhFvGpXaKEwx50Hxeiu/Fd/UCrWm4=;
	b=S/P7mupUUHY9YnHxqPsilVDOB0gj+bYX7U+Wby4uqNZ1O8iWVfZgkjXrV8s5USRfA2s+Hy
	7+bnr2SbzJELBNwMtYvzmMduuABLyqo3WI1mO6VKJ+4BwH4pl9MiM81lFYLuxWFhypOx4C
	KemLKVpjeSZ1q9YET0E01P5SpzQyyGw=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-_j-LEn63NcOA9t1oUk-B9g-1; Tue, 14 Jul 2026 10:17:54 -0400
X-MC-Unique: _j-LEn63NcOA9t1oUk-B9g-1
X-Mimecast-MFC-AGG-ID: _j-LEn63NcOA9t1oUk-B9g_1784038674
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a13e51ee7fso1647167eaf.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784038673; x=1784643473; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vGE7ci+ke1IPkdZhFvGpXaKEwx50Hxeiu/Fd/UCrWm4=;
        b=BmSaWELWesYNnahjIdEjtnLKxtDrhdOBcYMR1hX39ggMnu0M3MO0uBUoI9f1pvLrnr
         ge+CNVAYLrTDKJaX+F2oRDulVf4e9MgNpx+9wiNqpciJkGLf8LbFaY1RcL7pzYzQB3QD
         RxxtXHTCUimV+psGn72cBAI36edjWl3NRgeMOLBo4nbSk+01woFOBXMUALqqrqOY/7nR
         pJgcNzIvkfdy+EsrObLxwt6XQLAvZS0dreG0q+vWcaCsIrlveVZsCggRoWb4jGYiaqYc
         +bXCraMtR88bXhRnIzQ8aHOy9JAwgVtEuSwoqsHo5jaYku22dN9WjBWD5Lemqnlf/O37
         W41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038673; x=1784643473;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGE7ci+ke1IPkdZhFvGpXaKEwx50Hxeiu/Fd/UCrWm4=;
        b=gKpt4+Lefzlt2Q1XjemKnoZLo/EtTIJk/iH1sL37m6aFMOe/9JT28pC7Pic+KsB92M
         w9b8sPRCyaXwqKUuABK07dfgU/nNHM46wYMJZblME3ya107490tvJqyZy+VZxgeNFGA8
         O/WdesvI0xSJaEF+7vc6WtYcSpXyc8cXxhvn0Nx36qI/TIa/gRqwk/PeyLqkqUp9KlSe
         eklcleA7bZJIsPEGMAkfJytGji7o/MAiLNAFRfORfsGUVscD/eF2mds2Skq6Vm0xlAKv
         0+gh9NvS09REIaERlM87p/h1fz/TxDs/yo6bTauMhAK5qa6jzIjeJiw9fRB4Qsg4bo3L
         jx6A==
X-Forwarded-Encrypted: i=1; AFNElJ9/jsSjWtx3NU3C12XYD5WwTNgrCVrfHG7DsnZS+NzsDsQHoXj14laIDec1cwZh7ePab2lBdWZz1VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX1Y/wy0aISaWCwpIU8aK8aNICyLDF3fyvCvRr/zYICmag89Ti
	LA44BxWyZgnmQo3kNYCT6nfyNwMeJ9T1ICZQg6x2NbrGX8hmYLoDKO3IqQn47Ckr3LxURBCRLV1
	1pL7vEs/s5TyU1lSJR9+afC0C7cQka6LiDnQFyuEgQVZSAHHy9Dy6W8zqvUmtzQ==
X-Gm-Gg: AfdE7cl4Tt4yJM0JRZypFl1IQBkQKCr7IycIqTEiC2r7mOh3ToH6BQiGVhIztOOTFWM
	B/DefnFXWoNKNC7XG1unpG2NroXFP0Av0OiXeXVZ+TSHpijmUpKgFo9jxp+Kb2gb5uEF0Lfj58S
	lznxy0BJ8lsqHL+nCMYk+6Cn7t2PXgi4ahMn4FK7mh03BsH2XygOOpthX/o7B12jiFeSDcqAd0y
	2kKADQXECSUFdyc0+wE9afVTPh9WJLNC9eYzxt9gqU4feaRp3QQbI87TCRn7KFZxx6oFHsvcEca
	u9EtNvRIaCCmBfchPo3Wcyet+c0eVcdYW9jx3e1MijOKoBSRbghU3J5nUiTQ6sCDLNPd/6R6r0g
	dF2w/2JD7
X-Received: by 2002:a4a:e84b:0:b0:6a0:b429:443e with SMTP id 006d021491bc7-6a39a6737edmr8060434eaf.23.1784038673616;
        Tue, 14 Jul 2026 07:17:53 -0700 (PDT)
X-Received: by 2002:a4a:e84b:0:b0:6a0:b429:443e with SMTP id 006d021491bc7-6a39a6737edmr8060419eaf.23.1784038673181;
        Tue, 14 Jul 2026 07:17:53 -0700 (PDT)
Received: from redhat.com ([2600:382:8527:6e7:f2a6:402c:94ff:1948])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a8cb24dsm13607161eaf.14.2026.07.14.07.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:17:51 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:17:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: kdamaski <kostas.damaskinakis@gmail.com>
Cc: Yifeng Huang <huangyifeng@eswincomputing.com>,
	Xuyang Dong <dongxuyang@eswincomputing.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: eswin: Zero-initialize stack-allocated clk_init_data
Message-ID: <alZFDWYkt_ydsKL5@redhat.com>
References: <20260710141520.285132-1-kostas.damaskinakis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710141520.285132-1-kostas.damaskinakis@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 10, 2026 at 05:15:20PM +0300, kdamaski wrote:
> From: Kostas Damaskinakis <kostas.damaskinakis@gmail.com>
> 
> eswin_clk_register_pll() and eswin_register_clkdiv() declare a struct
> clk_init_data on the stack and only initialize some of its fields
> (parent_data respectively parent_hws). clk_core_populate_parent_map()
> checks parent_names first and parent_data second before falling back
> to parent_hws, so leftover stack garbage in the uninitialized fields
> hijacks parent resolution and the clk core dereferences a bogus
> pointer:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 000000000000000c
>   Oops [#1]
>   epc : __clk_register+0x31a/0x7f0
>   [<ffffffff805dc774>] __clk_register+0x31a/0x7f0
>   [<ffffffff805dcd76>] devm_clk_hw_register+0x2a/0x94
>   [<ffffffff805e319a>] eswin_register_clkdiv+0x80/0xd0
>   [<ffffffff805e34a0>] eswin_clk_register_clks+0x162/0x1a0
>   [<ffffffff805e3736>] eic7700_clk_probe+0x146/0x180
>   [<ffffffff8065d23c>] platform_probe+0x3c/0x7a
> 
> Observed on EIC7700 hardware (with the driver backported to a 6.17
> tree); whether the bug triggers depends entirely on what the stack
> happens to contain when the registration helpers run.
> 
> Zero-initialize both structures.
> 
> Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
> Signed-off-by: Kostas Damaskinakis <kostas.damaskinakis@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

