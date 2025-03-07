Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4213A86C
	for <linux-clk@vger.kernel.org>; Fri,  7 Mar 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741356779; cv=none; b=IMFZQiQml0YzO9Zkf7ClJgSIhAz2r8cFo6FRt+nSjADOY+aCv8+YWC0JAkgznssJNSy95CMxxfJrARrcJAI6eAJnrFT7DFbyy5Yv1B2JqtAfvHpWGIy9MB5KZx3hZBvDkG+up34CGAfzW0GiMS4KXajp6wwPQm7By/JNvP5wrAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741356779; c=relaxed/simple;
	bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFRxFvDBfH6fHhewOMTKnO4KaSfh9ZPeMQzaCkpM7QXD/9Q2NzLSC6MB1bPnX6vma6OES+iUViGcimBB+nctrKr3j404jyuZDGIH4qr012p5//stUUQOcC/PA6tdo2haG5AHKlok9N7MWFCJFljRnBvpvLXGv6SHEZ7SdSILde0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q4pF+Hjt; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q4pF+Hjt"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5fc6cd89f85so769104eaf.1
        for <linux-clk@vger.kernel.org>; Fri, 07 Mar 2025 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741356776; x=1741961576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=;
        b=Q4pF+Hjt6fmAMzrfiFom+p2VaMdCzP+ZMQ24GRgOHZE7TRwB6OxbesBD2DKj6Cj3ci
         ToBn98bzLWo9oJOg5t6L+s21a9rqnELOW+ljJD/OgZ6G2E+mTpKpRmmJ1s1SIICO8/K5
         MhVbWtTyBYkIeV1W6XJOd/Akzir0XcVkF1FkCIgztuwGYVqjL6OC7bGcDrgI524WxZxj
         Wz9GDm/ZS08h2yeRfCA+hXhcjgrAJXZT4noYghzV9FmRALNq+zCPdXbsGiINwVot3CSa
         thmXXSC+k+H/qToUcqO6YHhWxjQ/8XVo0sMlktoSR2XkdV9U+Nhryhf+6gStokaQ93FL
         3nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741356776; x=1741961576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=;
        b=J1CKzwfk+LVUs15Ma5HHgED4QXGyKqIkUgdA2pYAdXqxxz8Y82cvSXGVRr9aN7Bar2
         hLpXsZOXLa9QqMTDXDt2N+zXBphzSGaEWIdwS2gFvYmnM1UYKiVxkYHoCPquh5H7AyBZ
         rCwGmI2AGiTlHwtGMS10m8CguD3wC6YxVhg4Akopq/CAjGunUzlq0HDekcbz5RzCayOE
         tZ91yvZKG3iEEBTWgnKkKFAgxWhsk6SnU3pqjpW6m1LNpTmEfQ6bshDwQ6cdx8Jkb2zz
         ZpBl9hh/sR9ZPUyvAMdgpTTnaca/E9C8eQb21mCFgVVUFycsUM2+8NcnQkEbepMbkrDg
         Njeg==
X-Forwarded-Encrypted: i=1; AJvYcCV2XPXtlDx4rdTGUf+bgjIPbXoNK1XXahQguTOFrOptJVdnIB05mtfizqixoeiLrPB7Xu1BCLjdod4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjvC45Q34IpS19dcy58pWXj1BeIYkyo+CHmeENBdXI6rI70mag
	YCEHGvvV7pACyr2nYyRPjvn/omC3g9fyceHgwGlT9BAWn69fCkvcTPZyJU5+baVlBlZ/702zSHH
	Pc+SSf8NmyETR9I0iOx9qRG5PG2GjtcudYozAUA==
X-Gm-Gg: ASbGncsfYgJgTyfnfgjYTW9C/gnA2TX0+F6GvSN8+8lQ2026oQKa2QzX2jP5R9zRQdx
	jndG1axkGPcqGX/yGw8r1PgqmhamXYXNCU+TLk0wQSlaXlwhfqH2jvPXV/Z/d/QEEjWHTCYezij
	1j6UqBAbiLGa4mZm1JPjfkI218FGo=
X-Google-Smtp-Source: AGHT+IH9L2ObJ6dDXOCpIMSXNSBNafNehee0qnPWJxOsmaTrt6AVB5PDvXlGpGJ+NlBDx4GXdCpmmJeVhirk9krz6vY=
X-Received: by 2002:a4a:ec4c:0:b0:5fe:9a72:3dea with SMTP id
 006d021491bc7-6004a767138mr1732794eaf.1.1741356776690; Fri, 07 Mar 2025
 06:12:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
 <20250305-clk-samsung-headers-cleanup-v2-1-ea1ae8e9e2bf@linaro.org>
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-1-ea1ae8e9e2bf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Mar 2025 14:12:44 +0000
X-Gm-Features: AQ5f1JrAJDWL1aZmpxNwroG6aOpF70B9j3ySId9aUtSrljkJO2C5fdV0SfrMx24
Message-ID: <CADrjBPqxTiy8D8PVpZBzYnes-hxqKX+gd6a4WgJeDE=x7YQKAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: samsung: Add missing mod_devicetable.h header
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 20:03, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add an include for <mod_devicetable.h> in the drivers which use
> of_device_id table to bring its declaration directly, not through some
> other headers.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
