Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082DD2FDC3E
	for <linux-clk@vger.kernel.org>; Fri,  5 Sep 2025 08:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059486; cv=none; b=utmNOpFlOQkyIRzQ8I/1ptIH9zWDrwWApfpFxzLXnhofduLEoRcDE0FCy245c8KJbPUlMJMYhNwOkahcxGHSkfL6d3Gv2eQYF1QU9jQQMQvsorJYLczZtqSfiwpKpyRN9CLunow+MpJpxg1TR2sfH7xLuBfbFOMtiOFfuyouC8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059486; c=relaxed/simple;
	bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0uuVpJX/QhPrzcUTpE+Drp1yK58LQjV5rHERap6A1RhkptjjUacEjsM3KBsDp68qdf3mbQNJafZeUbUipXreanKh6lHHHjuLePKhT+6ftjV/owoKqAYfX9ktnzNU371oCg8LnspbPawndFD0AknDEbOeYAUhg2hFI/086uBwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Btp6hzfz; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Btp6hzfz"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-336c86796c0so15528051fa.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Sep 2025 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757059483; x=1757664283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=;
        b=Btp6hzfz4fIMQsarTFsMnLAfWVos9BkEPbBYhpuEYLDx26tordIN89lnk28EowcLDu
         Q0jXZGTXpVQtlsKCOFau9WlFu41K8TSr21Z6X2DbsH/kUm65eyg4FxoMMUt5ZSwZDWfn
         wns9vAoveW4954lfmyROdyO4NHh+xajzi7N+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059483; x=1757664283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=;
        b=RM6lTsMPnuAN2+nQJr4EZn4JJ0F6L32+H2NeBdarfeCDWJ1oy+J5o0+MUoMmDODjzb
         OL5xY+jg/o7Rkx1YX3/jAoqkCUx/ptAcKQ5Rwc8u2DT4jkaEO9RwucJhFEpqBRxdz9aL
         nkr+Jn6gsZV4pHzT1DFMgqzXQcD+VtFt12KjcLkcVF43DydWqUkPerQeQJQiPk7a03yv
         /85YDpDOHu92r7KL4BaVUKzwKTKoGcRCfD/jIKWGU5znVgtw4gQZ1hVBzid7Jn616fu2
         9/tPBgNvGID5v76GN/e1Mm4uckpHyy/1u31XP72MZbcm+3lFFGWNBeb0tv7zJIbjS2AP
         yPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUaIYKpOvDDio+DHKUDU+APjPnKiBR6wnkdFMVN/KU1lF26rPJSvaIk+D1AiAY69IWd/B3m9azyrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVOiAdPVQoZq4j/88Yw2BTaIfWadsM9O8PlOUErtiATnz/4n2
	9Q8ybDzr19LPDalZenMoSVgUdWDnKs0wfUoiPlYyXPwRgEJA+TblR4o/WteesseOaOG7I6Nuwx2
	G+ob+h61PouqOypBclHfC2rGxDM0ehf9bHQXPyco0
X-Gm-Gg: ASbGnctMxCO8gc85QtKEKiqHLQn7rcstrk0v0IffXjjviF/I/+S0axJgwQFo1/l9FQ/
	pj2rW4cMHMFl8FLaEoT/9FmvobHoZIeWVGw+tgl2012K54DWsaNRtYVuprftUvquR35lc6zAaQH
	ZvPgbqJxfFdtFHa0A9rUNYFnxSC0bUCaXycufndM1P39olE3W0oLD6b+afNg1ciEuesfEDZw9s3
	tGxneWLL5uQsdlEjVyBl7LpAl6NAe9MAcjR5xGcS5h5DhjS
X-Google-Smtp-Source: AGHT+IFYc+QgjrNQcnNX0OlLPGUtYQKqYiLrIJbM/loEuXaaE2NFn67DssV7d5/BEdo89ntnizvXLq3xRVbqrk9nj5U=
X-Received: by 2002:a05:651c:2106:b0:336:e176:cd3c with SMTP id
 38308e7fff4ca-336e176d479mr52475301fa.38.1757059483084; Fri, 05 Sep 2025
 01:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-20-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-20-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 16:04:32 +0800
X-Gm-Features: Ac12FXyKW6bhjZsI-yGgtsh7BXxxyLqh5BQG4iFyVSU7pOJ_sKap2vxzQ5qbqlw
Message-ID: <CAGXv+5F0pWn5+iE+3pgpZ+GMoXDV-eoEx4zKTfsmV5cpa-WC5Q@mail.gmail.com>
Subject: Re: [PATCH v5 19/27] clk: mediatek: Add MT8196 mdpsys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 mdpsys clock controller, which provides clock
> gate control for MDP.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

IMO removing CLK_OPS_PARENT_ENABLE is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Whether the hardware needs such a clock or not, we would need some input
from MediaTek. There's nothing in the datasheet on this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val
