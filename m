Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECA4C6D
	for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691926; cv=none; b=YhM6i78G5d+bVY7GPz1HHlaK0ElZYW1rjJ8mhzxRjnLxV+nmpGDiO+6gII02JkUjfvd3ZFjE70dn2jQ7VkLgWXTjEl+QQ7UbPPfKE7TzV8FS7iPJJF8+NPrZD1bt6k442Z7z5He6t/Aw5ebUV+0xeAxIkh6VxAQbCJH1k1yg1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691926; c=relaxed/simple;
	bh=b3JlCC4tL2Tz58FKwg2YL+SyAtOwXrfA/gsgi5WMt/A=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=iNm2Y1/ViKqTfShLy+KU2t629QmHo4MkfLhOPmZeEQVozvEdCciPVnpFqkpqpzixesgWfFkwuHYWAFQajZ7nmXUmsyQ6lEv1b+Iat04xxyp1DHA+AerkBmilF4OGGhDAmyqYmqwwEXfZ8UvxoWVMcM6SJu9mk1sEHEuYoEeZ3zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlhYebPa; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlhYebPa"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2c160308a54so3849640eec.0
        for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 02:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691923; x=1775296723; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPZRgmhGXKGLV4+N3md+ZOqvfZ5oB0BV4k3AKJQbhLw=;
        b=hlhYebPa5oD866bhGrd/E9DOI4xLPqqIBTNB58MI6CdiLe3RE62TMwDKXlT5JD9JHz
         616BnPap7CdTVnFhBgz1vNAQGISSEC6UKbM+tOLvrRlFVcbzBcrI4cKky7sUu2qgJ4sX
         esb+fG8/zEpOtMtAeSfw2QmIMue8UJ7bZmIBGfob3rD6Xv3MJ21axcBoS2W5kSerVQsE
         tfEGaebsgJnsUaKRNCmsXAcsz2vRhOYZP4/0+OcB/+t+DV0zUUDuXDPuQFc5W/jLyaIU
         yVE+fCtnWhzPC8ODrhs8bDg97Pn1/4nAx38AKFL8cWIQjWzg4YCemqayURr4y+W/0avQ
         5OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691923; x=1775296723;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPZRgmhGXKGLV4+N3md+ZOqvfZ5oB0BV4k3AKJQbhLw=;
        b=dYEieLPN1LeQsOY5mOVi+qYbxOqBTHWT2Ys2WjnvBQTmtuB+us4j0OpAkWrNpJl6Kt
         DLmOEuShCUrkllWgTZ9WnQw8mwfLQz/08/emtZxsRRqPxOTeMquYLtBn/7NPLwiDlll4
         ctr6+hnLmSQYaJ3toekbyS3EgElyjNQLA5mpVkMmhgacW76ejF9lACchCfxrs3YUie66
         a7+AJckxfmF0Z+5IOthHBfUbhI6e7hjTg9czGnEEKoZnikwIxNa4Y1eV6PjVMVSMEeJU
         A2wiMdFeX4ivnwkNAP4x+ezZDjH5zpJ5drb2AIs1E3czIkH2lLYxQtw+v7l+rbSzv8nS
         EKlw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ndp0lWs4ietpptCbEDNLwQ+Robq4gqaSHEK2Y3viqOP9E+3sa8r5xskU1rOvyr6I1TK4Wv3QIWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSeCG3tKYba0DddqW3mjMQAj34jVUDMz8rf1rTVud3DYT66mZ
	6OZoAg/Lh6Wwayae8LwHg2DKU4JDe0dIawB6thaiwu/MtkD9SoOKBnbO
X-Gm-Gg: ATEYQzwNOuCaGYSU1JGxGzP6I4GsHQ9G9GxhryT/P2oM+X6kRm1HisqT0HWAMXqV3ON
	UIQ04Txhm1CtH9g4sDC+uqfDDX+gTjpei3Q/DOCsima5DNhCZVgtHmrSyC1wVx0gaTJRafZNyhd
	HxMt9CwRyoAUjYBl/uOM2a5vO+kFev3gfV2bMtLYR5rTu4a04kyPaGKJl1h77ok7M2BNnM0+eVT
	8VuWt7LQ/gOlfAwKcE9MZ9VDkYRUC9anSzsWgIlEzKr0MCEit9VI+R1uzvHuIZxXFYibLd/OH39
	1wJeFkpWTLo+QXSuC1GPQ0U84fcdCELrYEk47MexuXWzMS+cfYgfWEgr/k4V6bPLS1RJlHSDDP8
	eT1VpuJ6Y23RmSbizGg5pIIJMIBz4OtF58YgpktcIXbqT0Fz7AOQFIYt8w1E8y1wLketdnEDnlS
	KaXTP2BumosmCYkU/ikO1Rp3sswtE=
X-Received: by 2002:a05:7022:b98:b0:127:33e0:ea33 with SMTP id a92af1059eb24-12ab28e4da2mr3105409c88.22.1774691922629;
        Sat, 28 Mar 2026 02:58:42 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c79722e0sm1866524eec.31.2026.03.28.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:58:42 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 17:58:39 +0800
Message-Id: <DHEBS4TLJV5W.3AO0UY2JXWAFE@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>, "liyeshan"
 <yeshan.li@spacemit.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>
 <20260327-granite-giraffe-of-infinity-ff49a3@quoll>
In-Reply-To: <20260327-granite-giraffe-of-infinity-ff49a3@quoll>

On Fri Mar 27, 2026 at 3:30 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:18PM +0800, Troy Mitchell wrote:
>> From: liyeshan <yeshan.li@spacemit.com>
>>=20
>> Add device tree binding header for SpacemiT k3 DMA request numbers. This
>
> Why?
The DMA request mappings are hardware-hardwired and differ between the K1 a=
nd K3 SoCs.
Therefore, separate header files are required to define these unique consta=
nts for each
platform to ensure correct DMA channel allocation in the device tree.
>
>> defines the DMA request mapping for non-secure peripherals including UAR=
T,
>> I2C, SSP/SPI, CAN, and QSPI.
>>=20
>> Signed-off-by: liyeshan <yeshan.li@spacemit.com>
>
> Name looks close to login name?
I will contact her and confirm.
>
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  include/dt-bindings/dma/k3-pdma.h | 83 ++++++++++++++++++++++++++++++++=
+++++++
>
> I am already confused what is happening in this patchset - so which
> device are you adding? K1 or K3?
Aside from this K1-related patch, the rest of the series focuses on adding =
support for
the K3 SoC. I included the K1 header because I noticed it was missing in th=
e upstream
tree while working on the K3 support.

It seems my attempt to 'clean up' K1 while adding K3 has caused unnecessary=
 confusion.
Would you prefer me to remove the K1 patch from this series and submit it a=
s a separate
patch?

                                    - Troy
