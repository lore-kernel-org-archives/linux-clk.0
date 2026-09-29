Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3F93EC830
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700779; cv=none; b=VKRM+/HZFhpPWgH80KDnpfVVgFK6pW/zLNw9E3z0SZphMmLB6mV8kUALfSEKrsva1p50liOBf4xm8UuRROyxeS1CdnCDup3VsqpaKiYabrTXRdg5mv9FOuGzi9lB7uSodcD1pyt/SiL+9Qen6pd3amryD1kdfuIUw5T+Pum4Yzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700779; c=relaxed/simple;
	bh=qaFCsp8c7CGfKFzZ18kTQk2ARCzvSbrZ20wb3yYF6SM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I8SRIl9H4Jq2CgCDoRmrmO5cydSAj6KPX96oKp6IoJW7X3tf33ISGAVXgX+zOYBSYaUb3Qc9QRsjrmvTCoU5JrnHWWwz2JXnkKbMSaUsuDc0ZsFnpEG9ypJOrlMzAAm5MH8SRgIUZvbFL+iOkiHh6yOpKSt3+wpN7GcgTHdKBtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dUcghjw9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=egRAHL+q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dUcghjw9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="egRAHL+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
	b=dUcghjw9gZVrWVqhnBexcq9veeCro3FTcgwcEutZxrnS+sips9AMeQZ915hQJkIHtf8SU/
	gEnKbsBypd3YhJAE7QU7IDAKBnIc00o2yOpVWVlyGu9+ONKeAK0c9PsnwQXVTqCkIl9FTf
	A/twVWewIOjCZ0fM6WIVxJPsuCKsI9g=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-hFwfVih4PPqnE313ufviOQ-1; Tue, 29 Sep 2026 12:52:55 -0400
X-MC-Unique: hFwfVih4PPqnE313ufviOQ-1
X-Mimecast-MFC-AGG-ID: hFwfVih4PPqnE313ufviOQ_1790700775
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9175cbd3beaso41519776d6.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700775; x=1791305575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
        b=egRAHL+qQ5CsChrxeHhQheTQlicf6Zg5ZZZ0h4csWN29n8Jl3FgT0q5I+5Q51oOimO
         qCDCsJvFpt/iGoRiGOv31u+KmRrRxXVyamegl8jj3aD7X/hIf7hbjs7wI9gKaocBAd38
         75bf1arsMHLrg9FEZkhg2PCidZVnb93XFAR8dxWuhTBfWaZEt25rhv8xo7ONYtqcNS67
         AYn7sjQuMLbUaI8LYHvriFz866tzGfyjsX6Pk5T0e9BQhNi3EDxBJjh6gmUhgH9XgxQ7
         nwcBAhoUo4n0rGN8BZ/AeP7WJyO16RauklOZMUtYpxa8hiU5vX8SI5BCohZ98/Bz7oxL
         JuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700775; x=1791305575;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o1EgwQzbNDEuQMqlYhAahN+QI0brKkw8w3Pq8/8w4M=;
        b=fYxR8THAF1uXEkVl/pbQy9/S3GRnj8a5wiKbvAKciK5RpcE8jfuHznDeKlxUl2EwFH
         NJLsfsvVu1F0i4NllbvPvoNHWn9p66bVzqkZlDo/cqqexdrqUyZmMUr8ew1M53yjB6u6
         1Yue3l2Po53oX8ZenmSHdVmMSw8epQ5/P1VXxtCTNKR2VxDnvRGQGUNCaILH/gF4rG2z
         IfIPD6wbPCxBuGpdl0ZSSmAg0SYY8C5QSHEDUVbO51RHkL7AKLY4r49nb45xL7418I2J
         aXGcH2Fhd6rP9glyLPI9XcknKK49dSV4lLZU9t0gRBSBd/HXUtklsbJCyOxtBWIHJQBv
         EXCQ==
X-Gm-Message-State: AFq9FYL4TTGsYkF3cBfsS5GocQ3JosOJZX/46HKNJLAtmB9jeXs4HLXE
	xa5JI5oiG0bhwaurH+mFZnF79oBj635plvPZrUYvo4uYP+b9W/uUuNyRX+Tfk8vfOlu0mZEpKSx
	7hptw4xTJM3Cwch+HciuxOBvFpyQJeKaTR6wMIFixcjUfSUP6BeIvPcJXQ03fZw==
X-Gm-Gg: AYBFou1FdUyKP69bYQghWHUNXza6nQjolMZUdMHzP8Y1NajXGR7genkRNDck9tefD9v
	Qiniy+A907jSCz/5j4KzgTxNe0J1KWbsFFdzY8wzrw9qYBYnl2kNsJ3rlGyWwEu4tQiNAH3KWn8
	0i0oB3V/3Walfhs56S1s7aF7SXlMXhp5AE70rxfTuHVLKcWeWOR90vyL++8biwk6Vq4FeF3vtKN
	C1qYOw0uoZ/yF7RM9dEzZ9bDkMcDw6GIC2aIDfRpqaemkEq7N+kkhUsFxYSYh5j9MUBctstOLIh
	uj0Uoz5bVaA3vnhR7q2j93K6fZcw2MHAef8BFZeImESjlBuU2VbTEoW00dMsH8VcySAHbigvQhK
	sSw0yJad/GnjT3HJwrjhlZOTn/xBzRxuNvgO6YabpBAnG4ebu6dQ=
X-Received: by 2002:a05:6214:2f89:b0:914:2b93:3f3 with SMTP id 6a1803df08f44-9142f6ea654mr302167306d6.14.1790700774716;
        Tue, 29 Sep 2026 09:52:54 -0700 (PDT)
X-Received: by 2002:a05:6214:2f89:b0:914:2b93:3f3 with SMTP id 6a1803df08f44-9142f6ea654mr302166736d6.14.1790700774056;
        Tue, 29 Sep 2026 09:52:54 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d343c11sm14454746d6.25.2026.09.29.09.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tero Kristo <kristo@kernel.org>, Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
References: <20260906-ti-fapll-clock-v3-1-b0ded340c62b@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clock: ti,dm816-fapll-clock: Convert
 to DT schema
Message-Id: <179070075682.199845.16100370158110486691.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:52:36 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=329; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bJDs7mdWAsDC2TJlkeIHEoIE2dsMin2hdtYBCmAzCEU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v3m0NebrBsm9mQ4Hl9y92DZzMu/iiz+4DlU0rzR9M
 1FA12daXEcpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATuenP8M9CTMaqS9xVQDf2
 cnxPoWMZh/VbFoG9r95JzwtcvCnyym2G//7vCvlD08qexIVmN324cEI2b/GkzxeO7uRkE1lgW8F
 bzwQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 02:52:04 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT schema
      commit: 64461f89a37a788789a1ce22979e3c0695ae0497

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

