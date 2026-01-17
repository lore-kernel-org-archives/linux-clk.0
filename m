Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1FB469D
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 00:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608671; cv=none; b=mSiL9Gzfcy3sZbEIVlMthmdsVY7HQm6AIptdMnSyoGJWmRVs3uYks83zkPwgRa/oPzWKKFtzALg5A3uqSiS+xsCni/1QJYBty3QvHYqvOyTYxWZFxPX6jjQ2h9j26TqBrBf6tfhM1ZkpnUtPHGVkDi4S+bKas9lKJU5Pq9jnRVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608671; c=relaxed/simple;
	bh=P/oahKn22V1Q/qKIOgeNOxr9OQ5K7jy4uqISMhIitG8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dxaZy0qclOK2AiJKzqnt4gRBlnawDjLS7lPY/IrfNyJJqRe+sR1lR5k6Cbf+A55nmwGXmTrYIsaJsCOTNWBqPYKPtHQS+vq4Oq/C24897ET63kXM2Ha5Jm+/mfuF+v5ZzTc9OlALLLoyIxGr+E1/MVHOJnA/z7bX9oQ2oY6DU0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIHupAFy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIHupAFy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee974e230so22882665e9.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768608668; x=1769213468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7KP989+MtQ/Vx2GH1+7AMZFtXODIHzXJuAD4CeYR4A=;
        b=lIHupAFy1lJTOEiumLHcyFNiD+bFp4SOxA+BzH9b16dCc/rI/hoBrUFtd0HFf0sLvz
         3L+QlLxLTNWePwdTGDDo0qxdK1CNbnaVOdfa6W+x9F01m3gTKsOGhLUG7BTpATh6kM60
         vqZM9AhiPUzsctYRivq4JMsrbPAlp8f3MNmA6V318HgiijMcO6u0HrRC5YDbr+Ewma9T
         qxUWkjF3B3ApPFrKkQz6GQXTliAofAVU6EbUA1W+v9CaYtvKyJljZIKxv6/ceVRNwPbt
         Nw4T0WoZceFFFnlm7U4Gp6WKDmXfNdf0h6T4PRGo4cinYFPPF5a+6jZnuJV22EMu0DxQ
         lKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768608668; x=1769213468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7KP989+MtQ/Vx2GH1+7AMZFtXODIHzXJuAD4CeYR4A=;
        b=dHXEnw8hCzTuaL2WPXw9gXVpZzIE7sEGjWrKPuvmVNWJhMxItStt2QhMHPMo97V4Dq
         Qn7p7DUuSm3Sx5uBwqguUrxqQ+p0Q/bEwCKIZMGSptNmGu+yOBUIFmBjuirAXCtZXc7L
         MFjcazsUT3VRqncLkHcobLf6oIw322QDGvOkaO9lEbMWi8Y13VHc0A/1LCfukUck3ORI
         6NsXZgAVOjlTwREUNxhVJjRAXKFGODrWiUAmB0vHVVdc1CSSnFROfMayt2OQtxPiK/Oe
         bjT2ttVJ6nL2lwoljmotSzlA8MziWkDNnHGH7gbVIyWGjgA8aEG+/NWNu7vR6P0trGwL
         Fa+w==
X-Forwarded-Encrypted: i=1; AJvYcCUS5a7GX3kiKU/tWGHM2Ad6ulUiET5tX6Cve2j70ugc37HJypn4irsxksuYeaNnMYFXPiFG8oY757U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+dpBjK/9lZxR5gWsZ3rVa2sYDJ+s/jIr9yOtkwGJI0+MEfxkN
	fXlvCbIDn9qc3+jjtCpTKY+zf/y6HPPOwLQpzLWmONTsPnJvYGUf4T4g
X-Gm-Gg: AY/fxX5Sha1MoCj9Bp9izHJL1/3yA8EpbcV2U54W99gH+EXCZn97uyJKoCnXKw5LV2/
	Q1EI1u2L2yDX2+u5GJn9z0rltg8WlMVvFK73djuduKl4KFKp7Tc+K4bC9Bk8o8uOd/L5Q+yw0Ac
	4V+3ydKZsXXg/mCjcQZigncPfBsiVL+Ywhh13HFNsMjVMVcQafv6AEjzOH+e0BZGpplWd3bM3bQ
	af0eyCCjtLki9fvmw2zmHvqRCfJqCVVdC4aDcoWLHG7tHz16B1Rq58FYpwDs4Bkfg+zVMie1DDo
	sQBbU0B+gFku8VHoFNkC45wg9GYGp4hhtltSn9atgNvA19nBFptXsQTqeVaFDPqtr8ItFu6gl0M
	klKvwkw2med4bw9e/GNgPMclkuigW5D0WFn+mnZc5eLj6GH8efycqmcRMvA8TZOSgQhJk6T1nFg
	Mpx9IfkfyUZVctrRLs3uVUxUzgej2TyWzyZC32Q2FUmd0JafzwlsU3xy897PCBvaSUXqIU8N+e/
	fRr7Gs=
X-Received: by 2002:a05:600c:1c05:b0:47e:e952:86ca with SMTP id 5b1f17b1804b1-4801e2f28edmr51066635e9.2.1768608667711;
        Fri, 16 Jan 2026 16:11:07 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm120243635e9.11.2026.01.16.16.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:11:06 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Simplify with scoped for each OF child loop
Date: Sat, 17 Jan 2026 01:11:00 +0100
Message-ID: <176860865300.1484839.10997280341072285851.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102125019.65129-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125019.65129-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 02 Jan 2026 13:50:20 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] clk: tegra: tegra124-emc: Simplify with scoped for each OF child loop
      commit: 362b0c81b3a5a3d455577866cee6c300784a2ad8

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
