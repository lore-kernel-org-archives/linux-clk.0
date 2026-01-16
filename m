Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01411F9F70
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768598715; cv=pass; b=hkEf84liXwpe+ZBLrsVu4nj4gwHOuEfUuEvzp8W7Y3IeHwrVRiKi2sVRKjLJFRfoGpN+5/a+E6ShxA97ojmEltdAQ9Kh/Gry2vCF/UuUcVlTtvlnhmLL+F2yDVLCwGp235+QPosAy6ja1ywEp6XPHQWwKbnjzJHhNqeO3QPx5pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768598715; c=relaxed/simple;
	bh=mxbIo9HjWFsmyBKBsroE0HUQk3fFrXYb/WE89O0U/gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvJPfemS8ED+958HRc4nHpmZeKSeMo8idHAA0OWRC15PQ9xJddA6P9tzsxuBeheaS6lpWSqcyLfeAwWT+NFCsGmzoNPInoiftd77iSXo3dxI7Mk66mVMsq6KQT/gnmgoGMHiVEp6wbAZP+i5UMfF6bno9x0+bHfPwuX8aVEgQPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=RuhkY6M3; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="RuhkY6M3"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-647374e4cccso2183655d50.3
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:25:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768598713; cv=none;
        d=google.com; s=arc-20240605;
        b=Gy7oYuD1XoZBlGBBkHr3IHLQkGb1qaZDn/0SV9iB8bveOZ+PT2vjRL3ItCYEyi+K5K
         1UoCQMH3aPyxvNfa3X/NbjQH+4lIXPF+r6DChXaDztfcdWVj724BjYA3CYgfre1JKko0
         PUuzRWldWQ9uCl/Cbl0BSOq6/ePMGCCz5MmcNxZTzHpXsUmslVXnm1g2VLMuisx3COsA
         cjXPQ34ts79D15Kl4cWHz++R3vkjcxp4zGHBM5+GXM65zzypWz0jdLpyyDFMDblbeocY
         NqT9Tsf4nb0aC7O4oQ+IqlQZ5J070+kq6i6GY7csrd/d0dacMpPC23l5tmsbgQqlYqPY
         9llg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mxbIo9HjWFsmyBKBsroE0HUQk3fFrXYb/WE89O0U/gI=;
        fh=+1e1Dwq3HiBMOymOxQRtRajQ7p5P9kpkdzhLGcwEJOo=;
        b=PrDQ+U2pD99X3Cn6Y3jEIf/2Qr20tv4KTGJ5XLp5SGdGUPbtGAHnRGvwBPrR26iwtL
         KFfc3lKpbYLrO5rPqp0KbVo+uDmm0KW8MZ1v2R76lnkHyI7D1GMeUq0bXd8jR1uPzjLE
         h49WMgLZ4X9+N6k+/jUjjbEJchizXQ7fRsPNVfsV1JSnPdbeX/jYdbz59xBvckr33vWR
         se3MbZWLKh9FffKTQfQWlJxd9aeUkWOS/pzicTHHqHAL9KMsPnk6z9Pc2OLadvxlLAyS
         ZJ0wwT1TGmAZ+N0ZjKB40YDOsOsRfWfm4fmYRahXnJGklfvhR9IGgfAC6dijU/4vqhxG
         F6RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768598713; x=1769203513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxbIo9HjWFsmyBKBsroE0HUQk3fFrXYb/WE89O0U/gI=;
        b=RuhkY6M3Lx5Sra0DA2oYqNhZo5gByRGrQ2lrZ3OwQOjkheaCWQ1sQqZGdpIqCRpbLg
         zokuBeKMTkUNc8vvwB2bFe/j/bsmC3sdWTQs6LmRjRjLkzXDfXWQi66uRM2g2LyQWuHg
         kcYsrAgCEdM/aiBGPWVCEQdN/vjn/BBIfz01m7t1CCFo3iolJF6upUgM2cqmKoNox2Tl
         rKe+3kQSFdGzIMObHVliJ1zROULbR1BHggyG6xgiSL8ean3687ElE591XEpommXfsEpy
         GNOHWJN6n1maql7gHGJLraSLy/L9AE5UFOiSpspDAPVyBukNLSpkRdrsFb6nYJt1Tl+o
         cGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768598713; x=1769203513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxbIo9HjWFsmyBKBsroE0HUQk3fFrXYb/WE89O0U/gI=;
        b=W5uwVKnDJPO1iL8TLScOrH/ofMi8W8cGghVySkE0qdd5GDW75jichz2sw53u0P3Mfl
         Z+yYqP01sdAQC9WLoYZs+hkLkSyVDBDq1OegPrSuzCJpNfDyLLtPf/DcXn8dDzLV946g
         1j++4+ATGHTKCMFQp0XP7bqNba9kttfCiYv20wjRnwBSNwvnwDrXRIZLS01B1SNbYkRE
         HBC6fczWEWEfUGv9+U0uff1sGmkzPaGzKSUDY3PQ8bB/PnXZLsBdRc/1lWhDag4G1rnG
         Nyt98nHtO+tK3lGeJ7tH8AMCkofis8Pm13wL4BgEQnxcqmg8y1efXlsFPGuhlwV2zVdT
         qdQA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Dd1olhv1wfCmUm/ouroVZkQ8aWHOJ4xnuFYuMmmz9ONGqIstb6uPcqPpyUp2FSglSTAqB9dgvnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBmE6J5d9pTLh1qMhaaKzqjLa4gq1ItcCnZPAeJk1caBAx+5Ia
	PWs8qmIxEhifqqGSsaZgW9bZbpdhKnOlecSyAjYfhy/RO9s1ABlJB2zUc3nAn1s/ZCaiQFiObkW
	lfE/TfnCvnokY3yupr3s8MvQp9hN/C13T22KgTA6voA==
X-Gm-Gg: AY/fxX5lbsXqMHSIiAGC3JACZQk3geGVnbxkouM2gVznX5wJOM1aLCbuvaNmoqt+F6L
	vopm9yBGvu7tkrnzLEOdUjIuYCZ6MKnXGveL7FnzM/ZgcJ9WwbkJqRHU7IZnNZ/Tao8CXKJzJiZ
	BXfydjcGQU8AeFiO2sVcC7rbYHrmTD98NFAT9l0ra7bxe0JbcD8swLLSQ0ZG1nf27kgEg9E1Ek4
	FRuon5ZFp2oSHk7/jvomitz0OSRoZetGhJpnY8C/h0tZ/RRN7nLwCGhcrI/yBRLXqKnc0h+pU76
	NiKWklglg+u7MOf4qEvwos8vXCfMaFLVBI8fdp8JKFa0nTOQxGGMOI0GHiX3
X-Received: by 2002:a05:690e:1489:b0:644:28d2:a4a6 with SMTP id
 956f58d0204a3-649164f76dbmr3642894d50.47.1768598712888; Fri, 16 Jan 2026
 13:25:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>
 <20260116-unique-devious-elephant-e9de6d@quoll> <1ef5317a-93d0-4357-bfc3-ce780002734d@kernel.org>
In-Reply-To: <1ef5317a-93d0-4357-bfc3-ce780002734d@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:25:02 -0600
X-Gm-Features: AZwV_QidPk8Y4W8WRSMZEq2Ai2phZYkmta2y36cESHGQhYtUHli-ToYTUVaqpDk
Message-ID: <CAEev2e8i_4Dud-OdghjN+1Sp7n_9yNThwgDbirkREBJHChwscw@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: soc: tenstorrent: Add atlantis resets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Jan 16, 2026 at 3:03=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/01/2026 10:02, Krzysztof Kozlowski wrote:
> Ah, because you just added it in other patch. Then obviously this must
> be squashed. Why would you post an incomplete patch and fix it up
> immediately?
>
> Please read writing bindings document - it covers this case.
> Why aren't you posting COMPLETE bindings on first posting? This is now
> ABI break for no good reasons - you knew your device has resets.

I will squash down the commits so that there is just one commit with bindin=
gs.
