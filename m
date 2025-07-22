Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E8728B7FF
	for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753221500; cv=none; b=l+HUNu+E/IrWnAK8XqB5wISEIm/H6+rRHJwC6FCCPeO/2YxYD1e9TSj1YjizqU7LeLeKK30slAw2ichxaWppiIJx8BeLz/xEl74cos/IwELOHPeilvf+HzQhzBHSNwjyeSnQKsf7CtFO4APs6cvo3I84rfRT0tHXNgNWLUH92yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753221500; c=relaxed/simple;
	bh=EngUjsKE6ntaSga2u9NxwJiCa0I8KWoIYhdBjksfnBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjcJKnIIX3vPLDMr24kyMo/AvVhnG0tVf+m8+TrI1n+kzq9Fn3civNnqs5ftmp2WtAs4L6MdhKZnfix4UtA0UiYFpaA3JDVw2M85ZdlWgl4FUEezellkh39UofFSh48BtisiZ5R9PpRF5AKFMLcstFnGINDKNfxmKD7nGhHyOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UVCLt9hr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UVCLt9hr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso2193a12.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221497; x=1753826297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XphRFYGKTpOm5xqnRvI7xsnYVXmfTKHiTieuuJNNgkI=;
        b=UVCLt9hrIkRO21cndqVwG+FcQW3FCo2GmRfwuZDHOlTrI7SNrja+Mpmf7h185ZpHBH
         HJny8RyTGLnAEK7fUBtNYdmPGFyHl8jSDINWskWNGEE2vM2twjUD0oAZ0W0Dt8nCS3MB
         BHBj+GuCntnl741iXcVqJ3fnk3DhBbTd2LN0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221497; x=1753826297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XphRFYGKTpOm5xqnRvI7xsnYVXmfTKHiTieuuJNNgkI=;
        b=ItcFuwjxlPk6xU9kIPdaU/MGsbBzGAuoJenKZ7Hsb9fXe8Duk7n6k4GleZuFsLqyi+
         zSJ6KG6QXefBIVSG0OVnFvsGjlhQOZjHPvcaYtyZKgSnwjqkYMXMrJO//rhVI9qX8D3v
         bSf84tQBIlHQ3a9YodcrkV6fMlhddmOJ0iV0DbAPfsSixjV6N2XRWBpkuzBfD8Q1QNOR
         LOi9S+KCOtTPaz6VabKffovluCl/tB0Csoj1ytoobA0DkZ5cpK5lDmydT6JtXwGSL3Uy
         xtPUT7NwUVrMuX17Ja4SA5rFT8tjWybuDMJYEE3Jl2MJElQfWcO2DVYxcoFXdVp5pGi+
         B8og==
X-Forwarded-Encrypted: i=1; AJvYcCW7RAAPTgr6nNLpKASK2dWe2qeiGjh06N+9Leo74Ak+4Q6z1fzzGDlgbr4sapUEMYrhKDtdgYznNfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpMnXr+r5N5br/eU6rTByz11Sy7r5UrLnP2UPwJV9j84xYgXLs
	6mDxACVJlUbLB49kUeAunEoGMRlnHcnQtp2rbp2bdVq1EzmY7yafRrLKl1QgldQfaQmFVXPnZNc
	3WzEvUhEOw0JKaqcTIMuUVC56nWpAUwoDyRsjj5K5
X-Gm-Gg: ASbGncshuhpxVubWU88yq1311/ovnP/1cacx8wyBQGypgSw4SvpkenVrbxZSFAq8c3Z
	dL5S6ZGw3pIH8Emclk/+PwvAfBbw5WZTrzsnEJ+a+FBUqnYodQGjDHN6QfR3LTD7uuRx2eGFIfW
	YFgVYwaeLIigSmlvbymnwrL3gD9lGcyl+kdxTSc28zs/WlplsqoPhyogp5ftm4tM1tfVyYrGwbf
	zsS0LHcBSJE2XQHzx1OF2CmFkN5n2TIVWQtC3Udp0MP
X-Google-Smtp-Source: AGHT+IFp5y+l1fTW8GtjpxnnyEe4EWyuH/zYE3JF5LoJQi9huRUvCNpCO/HKD9InP/jd87P+NKE1aVh/xMR3qwPcil0=
X-Received: by 2002:a50:cd11:0:b0:612:7599:65c7 with SMTP id
 4fb4d7f45d1cf-6149ac2e0b6mr29581a12.6.1753221496595; Tue, 22 Jul 2025
 14:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:58:03 -0700
X-Gm-Features: Ac12FXx4M-_tpsnv6SoYOcaCR3mVKSUiARmyCSX04o5wxXNHMo0oAxmxSQQ0MIM
Message-ID: <CAODwPW-kVcnVtVakXs7aBcwb_nv0bLTaK5PKNo4zmJaJ=VC8Wg@mail.gmail.com>
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +  purpose of this node is to overall memory topology of the system, including the

nit: Might take the opportunity to fix the typo here (missing words:
"is to describe the overall memory topology").

>    - Julius Werner <jwerner@chromium.org>

Why remove me? (Although I'm also not really sure why I'm maintainer
for this file and Krzysztof for all the others, tbh.)

>  examples:
>    - |

I think that's a load-bearing pipe character you're removing here?

> -    lpddr-channel0 {
> +    memory-channel0 {

Just to double-check, the name of this node doesn't really mean
anything and isn't directly interpreted by the kernel, right? I'm fine
with changing the example here to fit better with the new expanded
scope of the schema, but we have existing firmware that generates
nodes with the `lpddr-channel0` name, I want to make sure that it
won't break from making changes here.
