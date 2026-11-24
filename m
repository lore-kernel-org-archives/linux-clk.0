Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503632;
	b=un9eZjPt8Q/UNNuHBq6I7125JXKfN+KLVWcYfahV1wDdv4NmNCA+CN2Dq0pa7u/vnt9Z
	 I4+6ogzAvIjLuFlaYmeekwLYQQolJ4EBJqOGL/5m7gq3vUuwC+X3lmH2ZtgtU9E8xAyV3
	 FWICtyF1oBInQOyNuT6sC/huYaSO56tBwRV6b29DoBL6ngMpEjVG9rh+SszAdbJ8QIEYj
	 vgfkymNxsFIMGe0HSmlkr5enVQmZPUUeyA6iSKxETdRRCPoe9giaOGy7wtQXYGHORsWaN
	 WNvFS8Nq2nJFTdjMkaTvU8gfGKsGEoK7DPcJPFfNjrhbRyH+rUN0OUoflyU4nXia3yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
	b=Q6kBy+z06ecUCZ8zRiVaNC74z+MJ4vFluorhcON8s9CjwCA2BAjcr01OyTQlMa9xxTBP
	 oJMBM611Vui8UuIXjK+GYUA/IQJ7pObd4pikSkPTsSPzlpi6/FnYuLJerkGEaQRiu5jRl
	 8AHMogSkI5AWlZKsuSrH/5v/NWIu4QV9lZMkNIWEZCmCL/mSudqEa4rFrR1hHKcaw+Ajl
	 1LEd9yuI9Gm1Bi6w3rrBqwvnvU50hv3nJElJGD7n0rd3PFe85ToVD8yE2cYNml7FnyQJj
	 8xoqkNnKQMIfY866xt/wLqfb4CkDHifQgvnv1oPQqpmd+5aaq3t/j1+rhBKj+FwzQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVGdd82U;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0830E606A327
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 07:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0830E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVGdd82U
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab4354db11so40501171fa.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503630; x=1796108430; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
        b=QVGdd82UruFfPdkhhDtfnYqoV6hQDoIc6LmdBLufjtmQpvNKfQQwYNlPT4YjkByGtC
         6b10N5ALfWr87MLq6fS42XMmf1oLMR0lG3tNc4la+6M161rsBCiPEePoiahvpmI08Q0Z
         aC53VISrmlWQvFm0CjvJHI1xPz0/R66Iz3+AvjcnKb1mVt0qOVT2+wIJk6LSYi4ate2X
         4S2MWMQVrYYIDvhFU0Kt9KID8whWfbFTA2VbauqgCBsy5/MTuy1exwBW+v/soVSc+irp
         EaLAxJqrZHrbGSaMGF5XpL87gVdKhgZTt3I1BMvo5spUCzG5KXRjOVvEysxZq4rlxvLm
         BBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503630; x=1796108430;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
        b=kZOSnHuDZQdph5mg/88lnBAxXrGvXT0PKyvtu/m7EzSsNqbx9QRBMxEzKE52rfj0AM
         Iz6UyectiKCj1vlNw0/1plhqN+DmdA3KRdE3gSnDTTod7Zy+QLYIMnGCoynpJUdEcUMc
         IovthUUbqUmKvng6t/xsloESAv9qYoUCNhv6IPVjdx7pPLTPVjYmY9Q887Cg0jl6PiFc
         Buo6hlg9xRBiA+wsZ0hefzX5USPKndSz6gm3/uR1d4LA4b7NZzB7JzRlQ797ARZ8RhP7
         RJh3kAd4q5IrS243NHD4MgHv75DDnHIpPj133jO1gvGBw2b/NJ1TOhw0DpY2QNm4pQ/+
         CuBg==
X-Forwarded-Encrypted: i=1; AL+hErFLj0pFmAyQZxWzJltllaVbzpC2saal4qKybZE90TDRpxHJ5rHlv3pElv9N8AnysRDaolYQ9xu9XjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/euEd/ADJ0dpcL85KKPr267jN5BZf6zfynOnJ/MELNrc9aLrcJ
	b5CTkprPUMazcV1C5mDlcLH14Azf9U+zPskQKhDH3F5ah9Hixz4pZgcZmRK/8uUNVIXPew==
X-Gm-Gg: AZFdTZc/z4m43nM/UieW4jC+4zB3uRE1hRFPrzHeZ5SeiyQXeOlR9GyoFTLAQbljnxm
	LkqjjFRcaHHQ8+MEcBuvT8box4E6cuMoHtLlTGlVAxVz2cgacMl4s3Y9kXowVyEdbly6/zEhNY3
	YKjTGTxjwiypc8NCkMruI3zHphU3O5IR5daW24V9oCp67lp6K/leyco6EghAulcO6qHKC/TpUg+
	uMQ30YQuYwTo8UuF3l6GwMd5N4a5z6n2Komug9CgdCPRLBagzWpSMyZpjMFxEYdajKSWOc0DDee
	buSg0dUqikhq1rC4pqrJdlqTq5lY5eRnrg8UbHRZa8TUjhDNw/p4F3KLRCih13MM/EK0oSyQvQN
	t0T6L+yFDkjFr/639eCsPQFhmjXshy3OiuOFHQFMiMO1g7UuM6ryg6BeEIfc+sHdPr5NwcA5Ndi
	/XOc8Zu85+oNmjtxHsGy6bvCNdfRJfGsIvUnUsrTvmNQGqml5spE1iAb6f+nriFkB5Vq+BHnP/q
	tSug4zbDPS2LuyGb4dWAzm9futpZNf9oiE4yr8su6PwgTsAFjjGWdlnIDPG0jI76A5D+zxlZmFk
	NvXNRzIZ/hM9it3clxGHtr2vpxEmFHWWjvlt+PkCj7bgWNLMOCgU5TI=
X-Received: by 2002:a05:6512:12c4:b0:5c1:563f:ff23 with SMTP id 2adb3069b0e04-5c1bc84ebc3mr3803268e87.61.1795503630067;
        Mon, 23 Nov 2026 23:00:30 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05e235sm3481118e87.64.2026.11.23.23.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:28 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/8] dt-bindings: clock: Describe CS7542 PCIe gates and resets
In-Reply-To: <831a6498-9c1a-4829-b47d-52035fe15444@kernel.org>
References: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
 <20261123-b4-cs7542-pcie-v1-2-4cde5201d404@gmail.com>
 <831a6498-9c1a-4829-b47d-52035fe15444@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352887.5.18085137758862458863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Krzysztof,

Agreed. I have folded these controls into the parent global syscon in the
separately posted shared-global follow-up:

https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/

The parent node now provides both clocks and resets directly. The prepared
PCIe revision removes this resource-less child binding/provider and uses
the parent. I will let the ongoing reviews settle before reposting the
PCIe series.

Thanks,
Fil

