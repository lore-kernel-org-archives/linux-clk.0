Received: from bayard.4d2.org (bayard.4d2.org [5.78.89.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099227726;
	Wed, 18 Dec 2024 11:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.89.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519989; cv=none; b=lvoz0der4P6J+GGLg7otVxFZe3z1ui0I/HamXfHa74KS/aqc3xkjrYtP19nwVRbTdS/C9Hhm9PvgExcn9UJUNlqwrlLViPawSGDEBn6HYmqODAtvog68qS7ZTARViq+6TtB/KefBwQBfw437WoRLF+bjU811L/oo6XjnGxoWQ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519989; c=relaxed/simple;
	bh=oXfPnGRFbEkjozDA407hzOTccmVamTWj4CrAxuE5vOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvzD74qukeX+kj54WWvzOFCUuSd7MgoROo9zICUlfXshFjrYIpPnkyeSjClYxdUB6ERsf32Cxja3ZW2Lq83vx0bTI2YC426MuS0raYWJblqC2KkqzCu04Gie7PaHO12+U6SdtwMBG1m5Yvy2hbVXBmm9Xlki7FIPcKe8r2mnvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=yXCprO+z; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=c3sb6tH8; arc=none smtp.client-ip=5.78.89.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="yXCprO+z";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="c3sb6tH8"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id ADB3C122FE21;
	Wed, 18 Dec 2024 02:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1734518833; bh=oXfPnGRFbEkjozDA407hzOTccmVamTWj4CrAxuE5vOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yXCprO+zF+z/QopJaV5ZmRrypeu/J2JBFbkHX0d4s9qR5bUe+HqGS27MBidilY+y0
	 ujz59XgbjC7WiX9XhySIhnQ3nbQzlFGMln6AbsbadGuIZur1SWr5p0Krmed0+hySXD
	 86cQjiLHB1vR78Mag1T7PYQSm8gHpwQG1GL43TLT7wo2yjYfAytVTrn6hmDvaMeCnh
	 O7Qj+L0vp1UYxZPOpuztHhWe9gtTpYEniTUzbSg+jfz2E4jBWlpwFmWnIvLxYHKTJQ
	 52yqgQp3OtSRAla595KKvVyjn97XTKUenAffRaqPbCLnT8CeSbA0DQEKENtSMclQpD
	 9VmPtTHBEGTJQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXDRVW_v-VyQ; Wed, 18 Dec 2024 02:47:11 -0800 (PST)
Received: from ketchup (unknown [183.217.82.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 0F10F122FE1A;
	Wed, 18 Dec 2024 02:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1734518831; bh=oXfPnGRFbEkjozDA407hzOTccmVamTWj4CrAxuE5vOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3sb6tH8CA4AY8pOYptyxflBrvbIt3zADorq8En3ckxb5UlhLO7Hmg0hXveio0EWE
	 Vhgy/5g6XPQ8qyxpb3o2Gt1AqXQisDelMx1ZMpzSP/y1NBPhHf5b+WeaqMqXaTcS+Y
	 7FGgits8FJLJjBgbLxfqQarAxMiOyamz7PZes8oFOF4MnRXEM4llTqJbvdXHwzGVRR
	 1yQTEazvXYpuVAbvk7CIatKJQBtaPBNaiVJ+YzDTYf4E3ideZqKLu4amHFi4AjF+ug
	 2PicQIpfV3uUr0V6qMEJgeP1nXNx9hsNxfnNy3E0+F2SOkiaaZ9Q/Id221vM0TGXZQ
	 z1P9iU/1JYY5Q==
Date: Wed, 18 Dec 2024 10:46:59 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 0/3] Add clock controller support for Spacemit K1
Message-ID: <Z2KoI9IXOKTcwJ-b@ketchup>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>

On Wed, Dec 04, 2024 at 03:54:25AM -0800, Emil Renner Berthing wrote:
> Haylen Chu wrote:
> > The clock tree of Spacemit K1 is managed by several independent
> > controllers in different SoC parts. In this series, all clock hardwares
> > in APBS, MPMU, APBC and APMU, are implemented. With some changes to UART
> > driver, CPU cores and UARTs could be brought up (see below). More clocks
> > will be implemented later soon.
> >
> > No device tree changes are included since Spacemit K1 UART needs two
> > clocks to operate, but for now the driver gets only one. I would like to
> > defer the changes until this is resolved.
> 
> Hi,
> 
> Do you have a git tree with these dt changes though? It's impossible to test
> this patchset without them.
> 
> /Emil

I'll send the dt changes together in v4, as suggested by Yixun.

Thanks,
Haylen
