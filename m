Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807BF2FFF89
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422806; cv=none; b=dTmwDsOzlnNkzTxs4riYxP5XRnOQh/qM0lBmJeDMiRIL0d1K3nUA6BxvW8xaDIQeqZF7sfFxEd2hDW0ROeJ5iKuG4s0j7qQ/JdVYWXeizVRBTaIh8HgarOW/IJZ02hUZfYVdFz7RI8p84RKUbSnHSwUGctMzCCIIEFpGchhmwK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422806; c=relaxed/simple;
	bh=VIFf1U5GRy0XwNaSKn2IE50Ho6S8Qyrd1XW4SiN5kJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJvkMPF9r3MwHw1t9bXTE3fY36DLMQirMeKDDAAL+dSnPGBOmPIyaHZHbtBCfR50cmEU7lqPO6z3aOurebnD6KftqjXsXEzGoHyY9cNjngqWTNWIzmg22NL43bLXaN3Eav3XxNneq0kNwlV5v1rxkH4WF3StRldl+lPWel7pSbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DynX/JLy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=noqQNVzH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DynX/JLy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="noqQNVzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766422803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0f4fyk4zQd9fdm0CypX1izzvghVD+Nvn4s4UeRXutpY=;
	b=DynX/JLywm7WGzHdQeYUDFRE67wpzJImZS2RNXAvPtjf3hAcKq1y+ZsxJELoCwnv8V10DX
	W4seGhz+4taPvZrRd+H9dvyRUPrp4xF5UB2tgBwPNhkrmMjAw3lZD9zPqQn2YRCwPoZaoj
	/FsiHyjw+advtHQBisYYqyRH9WwP7Uc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-Zkau9-x5P_eSUhaxoBq_dg-1; Mon, 22 Dec 2025 12:00:01 -0500
X-MC-Unique: Zkau9-x5P_eSUhaxoBq_dg-1
X-Mimecast-MFC-AGG-ID: Zkau9-x5P_eSUhaxoBq_dg_1766422801
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e235d4d2so1505808785a.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766422801; x=1767027601; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0f4fyk4zQd9fdm0CypX1izzvghVD+Nvn4s4UeRXutpY=;
        b=noqQNVzHciN3yMdTX8Dps/u2bH4VTzq0tnVvPTofml8KAZrO+4P0lpIIMO3/T2vodi
         PQNClCNfQs9EjrbREkdMuszY2rGCVl4NPbCIh2XIa0n8Vv/Y1dQAm2z+GAAXJYlgQFG8
         UYTZxrzJIPSVy00b0cBTQ7MCkQ/uWHwr2AyvLqxXGc7HNKUtvNWrDr9NN1jLW2xLcLtG
         1tUfD3aECYCKF/ew/6o3rcfX8pSP8uwp0IFN/8SCXnh8GZDEFIGojS1yRh55o6RVFmyA
         CMFGze0BpNxTeJiYCZx0zM9idpYSOUCaJtzgU5mDBtGVWxZ7AHnThZEAknwtkvMA2n7J
         Rvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422801; x=1767027601;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0f4fyk4zQd9fdm0CypX1izzvghVD+Nvn4s4UeRXutpY=;
        b=KkpyIVvLDShI6A6MQzDW3pxKJytUdap84tUdN/cGy/F0QvcWaQgQ09z5havRWfx57W
         y1CETBFPXgGXlaArQppiW8TgjNB4lN/dyKnDSCd9J179p9MzE16gFgzFqMQ21I4iWCFE
         qXxoUNp5nKx1DMQvcIencsrp43lqeaK32xIKxFskTUYrQpCmsU0lPi4Vz5gNWnufYsmi
         8jiKppbE1F8bAB3mTvZM47rT076UM+z+JNiY9VsQJHWvcybDpNNI0hbJd61U9wXMCVi0
         B01AQtpPcypw/Tv9t4Y8WT5Lklsxf2T3kjfpCwneV1T5PH10XCR72ovrqjSkxaX+jXiP
         IchA==
X-Forwarded-Encrypted: i=1; AJvYcCWlWo/3SAE3ROWyQqNkmJnhn/SPuE4G70cEMXDxaJvwgPCwXYhK9fLgaW7wDg6za7sXIa6EAwbO//w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKu7upxkct9l4kRJhbedgbjnT9pGJg3Y+w/Gb9cXOSrllVbO4
	aNwvUnBfp84NVzWEAfL2vcoETlBU0eD6iweOyuJr/a6NmqZxkUNUOxPTUgRsGGP4bdDarQ5AssT
	hA7ScdEeV/aTxJB7BiZzMNfYU3xq+C/96qjZFzGDHU8rRCMlODsvkzgPW29LpDA==
X-Gm-Gg: AY/fxX7FTxDOdTuAHRI1C2EQcJKWVNGY8kgIuYsXlI21ozLv54PosCA+3NS/vq8oTpu
	AaO5hAI95kN+lnj3vb8r1AMJ8Fyx1ST2K8xMR1VaLgOZoVdCU4wVd1z41w/EQKSPucggDTCiQu1
	0kKy1FGhfLkCxdTa1Z3tL01/CDfqNKg37TN8yum3EzXnyCQCLujlGKcLcF6Q0S3OIxEObuO0zpR
	gnhUVUrAcTGxVjDqbuc6nSy5nRSxMvPvWdRVbKm7Hr/Pm+0jsSB354YlCibORWSy5g5JmpigrVW
	f8cyCZGfzIUuF95B9qhrjPDDW2PAma+lwQL1aIutWK3lM9Y+UZvrqKKl2WPYECGLVMvOV15BLMN
	MvsJ/PuPtIjFPL5f4QxUeR77FGr2dYtg8/PTmPU9wLPIo
X-Received: by 2002:a05:620a:691a:b0:8a3:22d7:6ca3 with SMTP id af79cd13be357-8c08f66c311mr1952379985a.31.1766422801379;
        Mon, 22 Dec 2025 09:00:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAXWK3aLK/w4OobjiC8eVjtvAbAxtwT1W5l5sKLlnUZ5at1LIDG+lvn7LFEDMGYJA0qFTMJw==
X-Received: by 2002:a05:620a:691a:b0:8a3:22d7:6ca3 with SMTP id af79cd13be357-8c08f66c311mr1952376385a.31.1766422800985;
        Mon, 22 Dec 2025 09:00:00 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997addd5sm86399716d6.33.2025.12.22.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:00:00 -0800 (PST)
Date: Mon, 22 Dec 2025 11:59:56 -0500
From: Brian Masney <bmasney@redhat.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mo Elbadry <elbadrym@google.com>,
	Rom Lemarchand <romlem@google.com>,
	William Kennington <wak@google.com>,
	Yuxiao Zhang <yuxiaozhang@google.com>,
	"wthai@nvidia.com" <wthai@nvidia.com>,
	"leohu@nvidia.com" <leohu@nvidia.com>,
	"dkodihalli@nvidia.com" <dkodihalli@nvidia.com>,
	"spuranik@nvidia.com" <spuranik@nvidia.com>
Subject: Re: [PATCH v15 3/3] clk: aspeed: add AST2700 clock driver
Message-ID: <aUl5DPMq8jC1xjRu@redhat.com>
References: <20251010072540.666673-1-ryan_chen@aspeedtech.com>
 <20251010072540.666673-4-ryan_chen@aspeedtech.com>
 <TY2PPF5CB9A1BE64DCD487138F3BAC4FD34F2FCA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE64DCD487138F3BAC4FD34F2FCA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Ryan,

On Mon, Oct 27, 2025 at 06:24:59AM +0000, Ryan Chen wrote:
> Hello Stephen,
> 	Will this be accepted in clk-next?

Given that aspeed is a SoC vendor, and you already have multiple clk
drivers, I think at this point your best bet is to do what the other SoC
vendors currently do. I think you should:

- Create a new subdirectory drivers/clk/aspeed/
- Move the existing aspeed clk drivers into this subdirectory, and
  update the Makefiles / Kconfigs as appropriate.
- Add a new entry to the MAINTAINERS file for the aspeed clk drivers.
  You probably also want to have that entry cover the reset driver,
  and any other aspeed-specific drivers as well.
- Post that patch set. Include this new clk driver as a separate patch
  in that series. Feel free to CC me to the series and I'll review it
  for you.
- After it's reviewed, wait a week or two, and send Stephen a 
  'GIT PULL' using git request-pull. I can help you with the workflow
  if needed.
  
  One important detail is that you want to base your branch for the GIT
  PULL on the lowest common denominator, which is usually the latest rc1
  from Linus. So even if Linus is at rc5, try to base yours on rc1, unless
  there's some issue, and you need to document why. Stephen should get the
  merge to newer rcX branches from Linus, and not you.

When you send a PULL to Stephen, you can use 'b4 am' to assemble the
contents of your branch. When I sent him a PULL a few months ago, I
included the b4 commands that I used.

https://lore.kernel.org/all/aL8MXYrR5uoBa4cB@x1/

If he accepts the pull, you'll still need to post your patches to the
clk mailinglist, and have them reviewed on list. Folks from aspeed
should do that review publicly on the list.

Brian

