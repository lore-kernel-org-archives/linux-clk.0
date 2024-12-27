Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AD31F37A0
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303620; cv=none; b=NjkLNmVNrTIok7x8ozm27YaWeMg75PfOXfUO+IWjXD+6SuvRqx/fVu7J2uxo8D6keyd9vdAGMjaCTGbmpz1Ivq1WMK5LOmZPR75k8pSS0rXRC8Srgnmsrtese2kfH9er4hFAX3n0OeX+qL1GkQEab/4Af3K0qk2WolRjPgmWJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303620; c=relaxed/simple;
	bh=Nq96OkZh3I2dZ1KGPOiRpqceVPg6Y6dtZ8YbuLUGboM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uafvdzf5kGmalDm+xRXkVB18fWQoSpUHOpoUnzjl8PPa9T8BHhjrqoBfdzGikB6Ktcg05iu2Alg/TmeLremKLpZhX3CswvuhuHqtwdH7XA0vy5Hv24u7zRpSrMqNuqohDiCW5cIdD7R/asoRTsK4s+o1HxS21XqJWOY4gaTVV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YNxutRGK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YNxutRGK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso43606685e9.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303617; x=1735908417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UN1PfYXNv5GA5EWcDyG0SuUKxMnngW7vBJ/To7wqj0=;
        b=YNxutRGKIM/J75I6++IRPz/WDJjeWP8tFhcyUElvTZG1+hkszOFlUjtYerDb2KSTcW
         gGOgDdn5u/vEn65PjFIrIh5W6Kmd+4E8R8OaBLGKAaihfAWIzrVKXN379kZWYWRdDopp
         DpjlR2a1IO69MSkZGchEeqjP0/WZ64f3zxtUmvzJir+BqZm+5O/OAyCg5irpj4Hom5HH
         bDQPUPb97FkmFPl5EZX4qfs7ouiUTVFOzsHJD00MPGRKhhxCq5ohwFM9MxXvr+YggDe/
         w3c13OljeR0rY6Qb2uLwGL8hEUXXm6nK706GZxJNGmZBKAe20bFjHgvStcThzUNjvA5x
         mFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303617; x=1735908417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UN1PfYXNv5GA5EWcDyG0SuUKxMnngW7vBJ/To7wqj0=;
        b=jSGPIgiQcd6AoaoI4Bi5b/zEN03RU8HtUVhAt3AkdFYrYtYOwK8CnbuKGdu+x+oTqI
         X+/SpD338nNarQkpX5s5u3rwzCUQF7j0yNvD5/U8YhMJea3E8IjuKggVxZ7yls4Y7nqG
         ut0QlaUhH1rUUj9GJTPONaLsMgG32uYH8UUn3O2lvanaaBZKWJ22/CS2Hd9OJegm6n6Z
         qkgehB3FXiqE00HgDEDo4FU/huAzjzlRYARlRIEQBX6gFEC4iIo6uskYmY6heht1AiM3
         ewpbJClEsgYU/vl5RTk4TRMUNydfRZ5R3XNhRAz3T8p5oowaKgBBqJAyaZAxqjJZ6aLN
         X+eA==
X-Gm-Message-State: AOJu0YwfzIbeW6QxYVss6hb7yT833KYkl4Ignx4mJdHLT5wiVD6xWsLx
	Zv4VVdxAFSctYXo7imeE7BBOJn2dQFJNKymtwRsDgrMxMjiLgxOw19p/ASPZsQE=
X-Gm-Gg: ASbGnctuROFpX+HWm9HOCM8dadeQcypeqE0C7abNu5pxhPl6F00wc1bh7yqpFXIu1H8
	AMcQlphjYrHzbdb5HUDDJeqsStW8i8r+87mmtrhZY8fdMMCkY/seNJDa099xln0/lAHIKTU09E/
	kiwE9hwhyibIEzfPwi8C/oXs+jx9ec0vVwlcCdOqsTSCE0G4W3Q9K7+AD5VvJkAMXnzit0k2Yed
	9O4bwDq+RVu3J29hjWrbEa6UO2K2RKN108k+DTB9pa0OCXRpBEODKQC
X-Google-Smtp-Source: AGHT+IGUz2NO9FEIpAO3AKn3yA2N+FizKlvW523dxOyulaD8vq0KUtWqJu6Qzescg3PJZW/KKP45Nw==
X-Received: by 2002:a05:600c:585a:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-4365c770795mr216692485e9.4.1735303617020;
        Fri, 27 Dec 2024 04:46:57 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:56 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	shengjiu.wang@gmail.com,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
Date: Fri, 27 Dec 2024 14:46:02 +0200
Message-Id: <173530350112.4140483.13164625485950770989.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
References: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 19 Nov 2024 09:58:02 +0800, Shengjiu Wang wrote:
> The IMX93_CLK_SPDIF_GATE also controls the gate of IPG clock
> and root clock, need to define them separately.
> Otherwise driver disable IMX93_CLK_SPDIF_GATE will cause
> IPG clock is also disabled, then register accessing fail.
> 
> changes in v3:
> - add fixes tag for all 3 commits
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: imx93: Add SPDIF IPG clk
      commit: 32e9dea2645fa10dfa08b4e333918affaf1e4de5
[2/3] clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
      commit: 6a7853544482e2336b5b8bb9a4b964f9d687f290
[3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF IPG clock
      commit: 570b890e66334f283710af36feb2115f16c7a27c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
