Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419A538D8B
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 16:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700736; cv=none; b=kQvxFAWt7hCOTMFG11x5A41rKj1sO/2+OWAPEvNb/ALmaLCvWrqP00HOyHs9824V/LBb3gfFOLnhwuzEA9f8JNo6i0KkuyIAZnQ4TO/bgA5HHScLI43Fu6u0eUh8N3o9D4cPznLdV1NW/HtSYbYF4ghgLL6D+59nA8rf17i5gqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700736; c=relaxed/simple;
	bh=u8UUARJnM9dWTuc1nPtuk8G4AIrxZXkyqftRXwXnkoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JQ8Ou4G0yGunEzriQ2LGTCiI7/PdDQUuqEBXLUVZ9FJ51NyWC9bJOZQ29LzAdis4jwdmoZUUzVRP1AQYqLNBVNwaHNpH/qgZsF3MKAgTGbA2/UiahTi8az0QuYy58mJx0FLes6hzKlrHM9nQ1DGhry1JbSh8eUwv0PYiMet2KRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MymJSPXU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g6QTIBsI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MymJSPXU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g6QTIBsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ntaMCk3istfCuNAuKpSk63vz+dko19iSPj+OOJ65RUc=;
	b=MymJSPXUA2gzInwT57yl+fQY/hPPsk83UEPzmrhVRBx3esfcyl5+y6D6gh/SbWkrONYrpY
	p42a27QhlhnD/IBbG3kGIFzp8QzgAjIWTgutBbXC4YUpl9F0avtS1ACeFPq+nvbpksiNP0
	w1taDtwn4xv24S2QP5ov0O0emeW4cuA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-aYtvwyvaMheIWgQ-29B_0g-1; Tue, 29 Sep 2026 12:52:12 -0400
X-MC-Unique: aYtvwyvaMheIWgQ-29B_0g-1
X-Mimecast-MFC-AGG-ID: aYtvwyvaMheIWgQ-29B_0g_1790700732
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso937890285a.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700732; x=1791305532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntaMCk3istfCuNAuKpSk63vz+dko19iSPj+OOJ65RUc=;
        b=g6QTIBsIcEX8K5BLKffnt3BWb7+Rji+pS0EuHst0jYaTlBzHq8VPhJlSzq4HwmkrZy
         AppDdoj1jhuogAWHfOxEmhv0wix8ZDYiVtuypZE0I73knMdRW7R5YZ699hNoH72mK7NO
         ImkYTETGRZgWf36Aj3L9aRu5OnjA7IhgiFnk8aoKglmjdXpsTylZEISHEMoo4APZAhNI
         Yqz213pcSxPEwJplavrYatTVuiLUP6x626EmZ8Gu2Okrw6wUxSN34Qx307OUHagvEntO
         7IbruPuWUC1HLRAMNdaegVqw4wPzK/JXdW+iRbIuh/xCM40MVa7H9zloSaetQ7y35NAo
         W1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700732; x=1791305532;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntaMCk3istfCuNAuKpSk63vz+dko19iSPj+OOJ65RUc=;
        b=woLlRYTPlPjyKAQY0BrQplx0O9m01FwloAri1E2NaFDAz3WS8ryquDqPMsffCfEjo8
         lFk6IzT74G/WQs9rSJaFYjtWmdcFlYhNUpgco06qwA4daxtEuj9V5lQxjqUa+aiTKm1X
         BlcBx0FooD18MgMgucJz6aJzNrUY3k4t7jXPMXiDJiTWQlhQsU6aQifkw52NsqiqKHEQ
         aoD61K/y7vC3eACDKgINOBxSh6SfqLUQh8+w44FbI0W3KVbXnv3QoCUqw4A2yxTo/TwP
         2/9LIB11QJuQ9jeNmo1vGXvKfS8XutD5+ZuikcS78ZBslXT9aSB3FX7H7xR2ModCVjEK
         Mriw==
X-Gm-Message-State: AFuF++nLw6/tum/Qj/e3KvHuwKp+B4pBz1U7UAY12b8/GH5j1ruJhbPO
	9eV2qeSvm6rQ8Ny64/VhcNwgUrOwKyR9YoiF5RVx+sBh11yBoySeW3wKGx6kEXvR7XMz+pugSrM
	HSfndEF2n794vW5LXXSPCLdc3VpZAt9sJgjP8hZL4lxesBDq3XbrrxovCojXTMg==
X-Gm-Gg: AYBFou03ZI69m7aGUyUtpuyH6iYJGpc2eJqjdHgoqeEek/lQTv9QY3q4ez47pu+APCP
	hxgfGDvE8n49MtY/q8sizkFgmBpFQo5KH2k4qbO7418HMaNkLwyRSZ3QqYK5VRPdcJF15Pf/o+d
	3pzcCQ7besELNyJYVQoDZnNb77Ofn9nk2oUC6Zjv8nwYotL9oiwzh8DaYAl9dGbU/Dp/IpAM/ZS
	EIuNUSpUN3kAtl5SGC854qwMm0AjjFic4+pVeDa+9f1KAgOjBPnK/jixJp5xNZys6pcVAim/YTU
	u0A2FO5DpSotXalJzq73TY5MeQbkfLNB7BZKt+ZttA/zNXgsxo3jx2YN5o6zi3FJ7yul83DHxWY
	ajhRGKzBns+Kf0ocSPmZ1atv5v5BpQ4cM7l6/YTjrBqQSyQbsX18=
X-Received: by 2002:a05:620a:288f:b0:93b:d79b:9a61 with SMTP id af79cd13be357-93c9fc468b3mr9235985a.66.1790700731814;
        Tue, 29 Sep 2026 09:52:11 -0700 (PDT)
X-Received: by 2002:a05:620a:288f:b0:93b:d79b:9a61 with SMTP id af79cd13be357-93c9fc468b3mr9229885a.66.1790700731258;
        Tue, 29 Sep 2026 09:52:11 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f546693sm11365585a.40.2026.09.29.09.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com
In-Reply-To: <20260906-ti-adpll-v3-1-1f1ccda49c62@gmail.com>
References: <20260906-ti-adpll-v3-1-1f1ccda49c62@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT
 schema
Message-Id: <179070070989.199845.5903281798262570768.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:51:49 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=319; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=62+rscG0QJEUA2vTuNN1rLF/alg1AFPw4/CBZ/gPGqc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v9nxpU6gZIpqoMOv2qN7MxR+P3aJZ/Nfr/qqWivdW
 mDarE8PO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIu/mMDF+Np9U3JvrMuJ5y
 iuH73XLVVIZnOWwNokfzbp62f2zWHMLwT1/pcIfrOnbFvQYnjv85a1V1yS+oxI1p0r3ed5MPvc7
 04AEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 02:58:32 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema
      commit: 307bee2e5a6ede1c50dcbf1ef803c7be44fbbcb6

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

