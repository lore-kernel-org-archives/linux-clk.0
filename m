Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21456202960
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 04:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757046365; cv=none; b=c07tp4a9EaUJyjtTO7kGKJHAmip1SP9kwbdQ7N9uBJVJ66ChxyVDFKWhvkXIxND3JPTi3s92dzyyirqN8XdulHK13PCl3n1aYFWLvr5dppfFVIrMG4avBXxFlMfnMPbX+PYVGf7KOl3lujcsBLmTEXL9Wg7LXfzs7edvvVhnhus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757046365; c=relaxed/simple;
	bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1LVHk5Mhfo5xunWO9cgG/g8xBuSrYqshxj3RB5Oq5/KTaUUzDWOSp/p7YeWan+8rrbvPNKnqoa9uikk+769wXrIGG5jZo1YaW/s6qww4iNhqJsUqTAmbKrA5oFggIr7NZ+poYm+Jgp8CZ4g6EctVUoGA5VdJ/2wr0tt6I4mOfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=htMXJrRR; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="htMXJrRR"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f720ffe34so2246094e87.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 21:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757046361; x=1757651161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=;
        b=htMXJrRRMGYyCmihQClevvmjDrLBJX7Z/3XgUtOCOU7dthuqse7P5iUGq8/t1mW3V8
         fcpakuzx0HKkJ30QzYlnKffMhb+SdxpVUetVkESl6QcwonkAFCf2bUV1fGGzNQiN2Pve
         2oEnzR5onaauL8sipAf9CWGwPWzL2IUhU1GmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757046361; x=1757651161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHmo68YQ7L/duddAgclVIEvUtWdksnELEMP5v/s9PNQ=;
        b=FKYi+jBh/rKz35Khlxt6QWhvTGwocbsg/KkJ5NWFz1jVkULZVht333MkdHZLnQisb6
         RDWTNCNywQRK/vPNVHo0xjaJvIsQ0DWQT0iT8Ka3qHuv1fhKcwVJoDbKdI7r0LblrTZn
         6+p7Z45HjwqvGnZg30rUlCfS/ErU9ZOjKp63vkq/ePgvK9C5eT6fnaRpoT6i7Cfos1wh
         Sol4XzuOjxpfste8Wubypw8pX4tVsv6JGuZ5lA8rcxAf01W5+8j5K9d3MfMG8ngCqJvl
         UPePOKKqNorn5HN5Y+IzqNS3lnq3j/UCCVbEt2DeXEolNKMFLTCrfJpmy8rwlDhuxvku
         XYwg==
X-Forwarded-Encrypted: i=1; AJvYcCUpdeDrimBle/ixL+cEZyqLHK4k2OIChFo1QfEK8d2wkmgTXSSAUkPxpB0tDsXXni38S5MDb2tZb1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ewDGs5JCLAf259k/XEMtByNZLxL5tyaMIDuIDrS407GUZJ4F
	lmICO3NSiUncQ6t0xZBnR0pmHDm4OXySKe3u/lg0xU8mr7tv+b6iufC9l5shli3tNkJ+PAHulgz
	aPJgVuAMA+0fTAkdhAmycZy1F0n/8lJHE9aQShq11
X-Gm-Gg: ASbGncuGSvRpWlyCJZN8YBBEZJGUy59pfwtWG9zWTK5tLJZlqYPmE6OeZy5cd6neXiB
	shg3afUv8ze5/0WdhJHSk8Fcbg+5Df1GCjZheSMlMEOxJRb85h31EmFq2WvGt5hmZ+7ynXCJowB
	+a9kAn1opglIcbvk503hF8LVbV3knIIzmNdhXqdXScuFaHdFaJQGGUGBCal0Lizf5deMvls5QDX
	aNtmbcccOtpgLVF+HXiy9lMGTkmZ81qOacFVA==
X-Google-Smtp-Source: AGHT+IH5pWHA8nQf6AbDXyeEcMeTEINpq+oHNFsdmhAJKkVR1+KEZHE+PC3gHq59gfSmiiSALqCN4LCODqxkvK4xsXI=
X-Received: by 2002:a05:6512:3c93:b0:55f:552c:f731 with SMTP id
 2adb3069b0e04-56099453ef8mr666761e87.7.1757046361254; Thu, 04 Sep 2025
 21:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-8-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-8-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:25:50 +0800
X-Gm-Features: Ac12FXzDHpGuz6HiaGhCY4WidH-LRTm2axo9L1u6x0u8-eqIT-uiyLk75FyGJCg
Message-ID: <CAGXv+5FgKsg0sM6EXeTL=du2BY1xgH6jVmtQtb2M0kY3iix-tA@mail.gmail.com>
Subject: Re: [PATCH v5 07/27] clk: mediatek: clk-gate: Add ops for gates with
 HW voter
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 use a HW voter for gate enable/disable control. Voting is
> performed using set/clr regs, with a status bit used to verify the vote
> state. Add new set of gate clock operations with support for voting via
> set/clr regs.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
