Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2F740BCC7
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541169; cv=none; b=clMp/yNCG7zHQ+VV69XUcuAkFUrqDIrWvkY7zmDQ9vG+XYu4Sf0ENHSkKXMOO4/PfxsMwNAbLm4iPasS71jbdxLX/CwxLvsByvQ9ym7EUtE6fbs9O03LswQGRRPXQ5cTUnUisfiFyBWGRYWyjJ0SvfzKSmNbJ6HRp/PWoyz6pEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541169; c=relaxed/simple;
	bh=w+yettWEbO4HQd+AjKTwc0Fx05RcuCUOYg/X93t4kXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5Tbk//wtNJFWTOJ8TTRtccAshNKAHWK4uzmV46RGOkaKbzUs4fb4QRuBJGqstYcXagP8krN65qiLqqReVrKmSfvNVmtDXDzjRIK3gE+IDU1/UyBHunf/DHa6x1lADq/Ekamf9W2F2iLUYuF+anicO0jIPChsoPwqChPOvrPpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eRlQUlho; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lr3yHJw2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eRlQUlho";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lr3yHJw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781541167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bem14i6XFVMIN3uqnQMz5GECQrxxG7BjUnzzU6nRLFQ=;
	b=eRlQUlhokSyjsW4CyFNCRcYuzbVlc1eHEFTn3B3OdwW4ap/k0agUCHxenNa6ScARkHZesT
	z3Ti6cvUgscxEYjLRpdrQftlvqCofFLVTlgTqC7QCPKOjtzOnYeN3CNcXdXaJ78QqgIvMY
	f777fzDVXCNqX9ecnP+yxI0lJf8Ayjs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-oZa4yEf5OT6F4MIicUaUSg-1; Mon, 15 Jun 2026 12:32:45 -0400
X-MC-Unique: oZa4yEf5OT6F4MIicUaUSg-1
X-Mimecast-MFC-AGG-ID: oZa4yEf5OT6F4MIicUaUSg_1781541165
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cceb5a9686so101583816d6.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781541165; x=1782145965; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bem14i6XFVMIN3uqnQMz5GECQrxxG7BjUnzzU6nRLFQ=;
        b=Lr3yHJw2/XQG35P/BCQKt6nbkNUr/9hEXbiguf1GZz2iBUYNEmay1ZdhfEpitrHvsT
         2RB+PU46xhViApqjo6u5moFQL+VTeP817kYDLeWqkD07wydzCkzvVlznj3egMmcnkPYs
         IExhm+bvjhreaWZgAd0yD0XRJDeJ+QSsc6bKS/nilbQVmoKCCV15f0ZQlJBzWtz8xw+c
         B/ci8ZGOVjpRskfApoBQaZcCZgqm4Wk4G9ZyDKYMYWzJXY1t3VZFAhoDuyFZYRjMs5+V
         1WU8tK2JkNn9A7sCLjkjWU5q+fWzPn4YXvifqPbt5pPjNhOBJvBMXvFEfKDdX0Rw+VzT
         OVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541165; x=1782145965;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bem14i6XFVMIN3uqnQMz5GECQrxxG7BjUnzzU6nRLFQ=;
        b=kAo0usufc2l2/j/ziFOnn3pcX+gGqeuXr7SoZBhy9OZ3iL2CFck9hXF7S4Hlm5yrCi
         IAhs/BF4/ErTffNr/y+fxj2fty2Ozi0D1tYK+qSMChx1pXHjzAJTXdlTrwDQ5uEACgtG
         vIuol7F9kw5lw4j//cC9XxefIDHt1a+rijaexUSmh7fck5S3DFFjcwCYTlbtlvW4c+CI
         p1+Pmd6aShIr7Jpbw7bucXcr6LYsmnffcxjhbVsmBvkJe34+jouM8FuGLXj6F/Mya0kB
         8P4JFv6z6Yg5uAwdCNTL3TephMEbQ2JXNzutCRZVJETKWwgPz5qoI51pwCEHTp09YF1v
         ZJbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WGSlPOGIOAAMYyxH2aJWvyU5J5LHMGWa06/vnUlCZsvM3Tne5JBSTiem/mr42WK5s7YbjKCJnnwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB5Dw+SIW6OMB44cPzLczsqFfVRuDeF+ivRvhjzc/EVbta67Bo
	Z0XchpLUgW3iipx24KOyfKrM8hKT62UqEio+JShxEYmLbpjWNZqZM2d0Yl1hO5HyKK6mY/i50qc
	P0VDhCLvsEfrN9clkosfL2VkgDqk9ntWuxvcUEx1cK5apoRpvN06Wj2gwzHWh4Q1Ry0sshw==
X-Gm-Gg: Acq92OF+GfuH/82ClyYWWrLAZgg3bdgjjd9asiyKfnrZYv1H7pZLMQYfBpvYpI+S5KG
	ZAq3e2MkJpRDVRyeeL1K972euLQzulcTLB2MTtuAmELZ6rQgmD2hDcxgdp1ftOn2Qn4R1OjtDvG
	k/g+gp7E/X8SIW9lQ0A5bYvmd0IozfdUrhHoadrNyZM9PeB2hdzWecw1bwl06lawtLJbNZrcfs2
	OxsVj5728KIuw17QodMsyQlmGFNJYcdx1GUlhvYCqHQKscepO/OUq1wkMnu2A1WStM/3HCPTR41
	97GOjQPadiddMF0mb3p4F7kNCf84dNToeeAKLhOMk3qiPvwr9QU6mj6dfjmYd9ryMmAwp80O++l
	p+1IAbAO3umZMcnTAOEaNUcrykhhuQCd/sjew803p2YjuxGrJeKYPWU1F
X-Received: by 2002:a05:6214:4ec3:b0:8cc:ebbb:8bda with SMTP id 6a1803df08f44-8d44ffc4615mr188041856d6.39.1781541165107;
        Mon, 15 Jun 2026 09:32:45 -0700 (PDT)
X-Received: by 2002:a05:6214:4ec3:b0:8cc:ebbb:8bda with SMTP id 6a1803df08f44-8d44ffc4615mr188041396d6.39.1781541164605;
        Mon, 15 Jun 2026 09:32:44 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f47408besm2913396d6.28.2026.06.15.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:32:44 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:32:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
	linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: clocking-wizard: fix integer overflow in rate
 calculation
Message-ID: <ajApJ5RDcffKtZOH@redhat.com>
References: <20260605130340.3549582-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260605130340.3549582-1-pavel@loebl.cz>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, Jun 05, 2026 at 03:03:40PM +0200, Pavel Löbl wrote:
> When using driver on Zynq-7000 (32-bit) determine_rate calculation
> overflows. For instance requesting 32MHz with 100MHz parent clock
> results in 100000000*(4*1000+0) 32-bit multiplication.
> 
> Replace the expression with mult_frac which is already used in
> clk_wzrd_recalc_ratef.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7681f64e6404 ("clk: clocking-wizard: calculate dividers fractional parts")
> Signed-off-by: Pale Löbl <pavel@loebl.cz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

