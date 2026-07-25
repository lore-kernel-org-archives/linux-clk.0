Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1BF37C92B
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017169; cv=pass; b=Vpy7nqC2VCqA6XlXDC67xdeZ/u2TtrHT5mga20Ai0QmP/PPqlX6rthcgywO7/GBo08JVoiJ0oKOEFNl8t7WNYhesvItDot+fzG+Gv/jXOYmbV3E60RfkyUKuQe84AWbm2P5ISzn+SJpV/Pe4GT/Sr6Jx3i5AsaNktQ7zp1c8LaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017169; c=relaxed/simple;
	bh=PuJxkWbxxjGwAHNUh1rcqgo6iNIRPAowfqugEAiHDOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGyz46cb0Lj2pWVQ7LkY0vuhrGp0GKY68omLTdKCJfiiqkvSvAeEbqCvgEYHhryVlQ1NJCrAG5sbOhXTGe3C3e5RRE49Bh0AOzpL7frGyEEc3aRQ5GoirPzPU4CYfi8rJjE1Aoe3CS+bjtJvVTuz6AQ6zfNSW6mS/a2bX1TwmKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qzwpqnwu; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qzwpqnwu"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad4170e8eso23278835ad.3
        for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 15:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785017159; cv=none;
        d=google.com; s=arc-20260327;
        b=fGe/4/AwyVXJrKuP8ck9al912Cy2AYVz0Qudg1msekLxvKYTDzLgAcVTur8jlAWPH4
         UqUGF10T1xiJ8uwD9/8fLq0HiD33YuZSYSrvfcBOgmJT3x0V9qcCgUuuCaDYyOQ5Gjjm
         fbl+XYO0nqaI0UqaEmfR5it0gzMJN1SzlpnQLqgGOiM0EUhNCnebK1yxDmfgvbo3/TvE
         QaOe3W0UZJ4/9s3/2Z8Rsj4xH0pxjMJXBin9LpFyDKD+kNyQ9m4OlR2YOIMBmjXVVfzP
         UOfHBuWKOdApJ3yxYjK112wAakShimA9mnkxiwRgOLOkSoBjCqo7MCD5YARipKJadn44
         ubqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        fh=fOYrH2tdVmCQrhOFgyvMbU2nxzEY+yctfhJ768VQeJk=;
        b=QWy9bYRwlRqkEhCbZy+xu9cYOmxrb3mbMJvRmZq6cYDhbE7WMdKEmj0C79+VCgqPKU
         e70ecOuQQi/APX9ro4Th0CBX8cYAcgj0PNogVxeFYUimIFwpUuZmj1GuYbDRh040IOkW
         J2KlpI1eSB/Q8Doq4xjCpz2Lmv9loCFKg+FyPhuq7aUws4s9R7afhiygh5u4JzUARzVG
         lJLD9iDiUC1FNotMYuRd8+wrchWe9N8bvTK+Wq/mohnVpnQDH6uxLPbKplx59WzuSMo5
         Y3WjjD6wxfAH5FQOIsSQK4/H/dpgDOg0oiQRUlcHDHUETFZzGsNKMRNZ0aVKG+Ay8uf+
         UqEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1785017159; x=1785621959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        b=qzwpqnwu9BV3OhHOqDlLIsbmurMYPVqzAgOy/8gSMts1FKVlMRVz3xH8qRjezm5kCM
         8EL6CfaKxyBoX3wmLyfJVT9t9ov29OOtIYlCal79RNrbkRxslakqdpqkzMXDWb41uvHQ
         FONox5h1KSTnoLoFadk2M+aBCaoUKhVAclqV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785017159; x=1785621959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        b=kPrwCheyhZGbJgo3NLNaPGogZFqVQMomuIDzBBqz86gfoz8sZPCqMZK8F9GHg1J2iL
         q872B9vJx1IXJG0JAPO+FrZW55z/BJ7WyvSSv05oYqVdgWn3aD7y53cwyj8m6xlxbj+X
         btwiYalhQb6nyIk2RY33vNiGrCTmQbYga/EYaM8Rcx1Rq28ZtNVJdX7JnJ7Fx4KjbmWO
         priRz5SVK+2Z2cDzTX9BSEDxl9kmE5SMqixtqwzRRfbCNXbuzSfH5b9HRj1ODTUZfB5O
         Jvwl30yS8FSaaPosZX5Cz26oo8YzaFqjag2wR60RswkHd3cVpVetEmJHsuDkEqxXFxKR
         HvTw==
X-Forwarded-Encrypted: i=1; AHgh+Rqvv0LOs6xz1VkpCjidDZHcDLEwhCWQ85evxJnmKwJUA5xjIoHSXmt/L5v9PunSGHyO9+VytmBAiOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKGhz0um6rtWfaI3AAnxBrYGbCk16VaU/OYCAEkSvYPmsTIEBO
	vu6suRL9IZ6gGBw/RduaC3jR2OCpeeyy/+lvPDhB8uBiUlp2jjnLKyIjNelRupZ45FW36zoPHLa
	hszyDVxKVb1g3dAOfuzuRX2cxOuoNvfLQwxduEnI6eA==
X-Gm-Gg: AR+sD124fNr4tccvSMJuD2KaGybhiShy6v2riCBLprdDk6oC/hdx38WbDrEqX2ONctg
	OegNVjobylIVo0OZIBfZICwy4Fas+kfeH3CyKcA7k8sswInY1LTDuQOXkmiOQuvWMohE/TGe7xi
	savlKl1okhlpuHCaXDwRxXXAD9VeoW99HYRYgNJMNGoKx18V/SqcxxferArMmN593MPAq1mpNFd
	uJur2M64CyYrpEt9PeQJxDbpcr6dltqqkp2pMnrkbqSJb5f2JabBi6vMzTb8+FmYaTO4V9CzI+5
	I6MnIcGes6hJl5ABDEedNLRZ0IUthbCxuwEzMs6X4r0h5OaO6qn1G8cbQxPlRmdN1SnwPdwMuvC
	PjvqYu283fXmfeMo/Jon4ehnTxRBRnxJLZaj6IaGUxX1BmbPt+Xh1SwRuluWEhdwt87lCq7jPc/
	O7yvGwEFCIOhMa27mkF9MJ892xVu+vfZ58XcZqYoXjPUecq9tmWuGIy0Mldx1j
X-Received: by 2002:a17:903:22c9:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2cfde687914mr33554325ad.6.1785017159017; Sat, 25 Jul 2026
 15:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <CAMVG2stKmNxe-mdqbqO4MDLDrJCiNXw9kt8SA8egYAmByf9fKw@mail.gmail.com> <0eca3486-57c9-469f-b846-8c10ec07ffba@kernel.org>
In-Reply-To: <0eca3486-57c9-469f-b846-8c10ec07ffba@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 26 Jul 2026 06:05:47 +0800
X-Gm-Features: AUfX_myiHAoB9UrW4Ep9Nn6HkjmTDkhFOjfKf8GaUMMaVbSg4cGPO6RekbYQPSY
Message-ID: <CAMVG2suGdLUcA1gCjNq4xi_wq8QJhx3LeLcNqDJpgBUZLZ-2uA@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 Jul 2026 at 22:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 25/07/2026 14:47, Daniel J Blueman wrote:
> > On Wed, 8 Jul 2026 at 08:06, Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> >> Changes in v12:
> >> - Updates camss sensor find method to find the sensor in the CSIPHY port. -
> >>   Neil, Vlad, Bryan
> >> - Drops dependency on passing polarities and positions. Moved into CSIPHY
> >>   port as agreed. Neil, Vlad, Bryan
> >> - Omitted mux to CSID as discussed this will be done when splitting CSID
> >>   out as its own individual node. Neil, Bryan
> >> - Updated Reviewed-by: - Loic
> >> - Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
> > [...]
> >> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Works for me on 7.2.0-rc4 with 'qcam'.
> >
> > Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
> >
>
> You cannot test bindings and I doubt that you actually tested even the
> driver code without DTS.

This series was tested as a dependent of and together with
https://lore.kernel.org/lkml/20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org/
and other dependents on my X1E setup.

Thanks,
  Dan
-- 
Daniel J Blueman
