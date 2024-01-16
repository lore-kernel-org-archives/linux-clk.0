Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7D1CD07
	for <linux-clk@vger.kernel.org>; Tue, 16 Jan 2024 17:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705427034; cv=none; b=cCYqVgobWdiaZ5ZuBJWIShGVY5/POyS1W8JgXmRd/e3Jxg7bZ4Zd7YWM9Wnao+FqNiuaq1IYECYOljUHGmouZXVi7dU1dvCVzXF5ELzFH1T/SL4pZ979esR934UpxMzSnYpK0TxXt6q3CYlOlEt/bzhh9PWaIMFyEg8pS/K6PSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705427034; c=relaxed/simple;
	bh=/5RHq/YUI+hVWY/e6eVlbHgLBhBZafmQizAWBbYsCwk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=AajDDfGVybQ34KZcE3RAeTylgB0QrjAF1Yu88qcogjxz39XHDTaA1tNycSwhoO4+aH5PZW4pEdWT/PexV8Ua1QTGQzxxyTNfnSWQICuhmhMvotp3qqMgzFyQip4K328QDtM4/XlPXhTTA6iZKSrdqOtkY63sReO9nW1tzw440RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kytYOVsL; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kytYOVsL"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6dddb927d02so5067377a34.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jan 2024 09:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705427032; x=1706031832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sadTVFX/+yOxJi04GWahAJ/5tRCyZICMzUufzMQzqTs=;
        b=kytYOVsLpgGPnOWZyUS2ZYPnNospG68NYHcfCGdQm4YT4Wemn5GnlaJA9xp3OOiGvW
         pYenBsMEW95zkvgxXtT1KbyU8wsXjDf+b7Ax69cyRYuBBj8BVUcA7rtna+F7qajviC/F
         qlRSXSsjp0lL9+iZR/UAQPNgxLqHDKDEDmKPWDbDIocIIL4LLIpx/m+Leyb7ey3NOwT7
         Fjp371GLQ4p8D9OKuuzskbGSPDbUHFtfmavg9Nc8+Zp1ZvYgsXFSCnkPn/1pT68LA3MH
         ekWFgTa0yj0iqhIMpkOZk1GalDGnTwH7NeT2IQVNuMUiJncrJb9IfrSmXbKbHnYLDwbW
         5qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705427032; x=1706031832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sadTVFX/+yOxJi04GWahAJ/5tRCyZICMzUufzMQzqTs=;
        b=Cq5pBj19yxjH/E8/4Xr66kNJQ0z3xSMUrR3gW3pglTHFLTg+Qyr/i0ecQmvXKIezlf
         ePIqeu7OVaMJsvbFrVqu/OVXBb03+BXkE+3fyaENsUWBtofMxv3cWVE804Q5FUnI9hgZ
         diE83h20k+rI2/dHrJ0T7+AKjZKpDSJb4OvUQRNPW+k4ws7FI5pMBi37ARDWaALYfW+b
         t288rvmbzlZrwfy5LHnxyRP16FS3oDXBU84QEse4q3Wemhj+iNDuxD8FGo/wewTRAPBY
         0+vboF1TeXNlHCoLvejjUT9MH4sbhB+y9eXC+2lAHIP0lw1ScI1c1uP16JLYvoPP4BVt
         ycgw==
X-Gm-Message-State: AOJu0YyiMLA11+t9sY/QQCmGAWx2AJhHuJr+7sseTliw6bZ6K1BceUqI
	QDCj/utVG83MEMEy2j8R8+c9U8euc7F6D4G0LSByqFuab+avbw==
X-Google-Smtp-Source: AGHT+IGI87JfSO1MZ7YpCV7ykS5z6dPmVztVmhDswHZl7XYfkO+o3BgBUIEzwgatKdnzSh1R8Y7xKS2CmWu9HOzK/b8=
X-Received: by 2002:a05:6358:611b:b0:175:77e8:6c31 with SMTP id
 27-20020a056358611b00b0017577e86c31mr4700924rws.42.1705427032574; Tue, 16 Jan
 2024 09:43:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109114908.3623645-1-tudor.ambarus@linaro.org> <20240109114908.3623645-2-tudor.ambarus@linaro.org>
In-Reply-To: <20240109114908.3623645-2-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 11:43:41 -0600
Message-ID: <CAPLW+4nz9nOYgdkYGc47h2LRnDpO=ZG0vmNgyNXV5YkSQEqE_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: gs101: rename cmu_misc clock-names
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
	peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 5:49=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> 'bus' and 'ip' are sufficient because naming is local to the module.
> As the bindings have not made a release yet, rename the cmu_misc
> clock-names.
>
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock manageme=
nt unit bindings")
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/clock/google,gs101-clock.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.y=
aml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> index 3eebc03a309b..ca7fdada3ff2 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -85,8 +85,8 @@ allOf:
>
>          clock-names:
>            items:
> -            - const: dout_cmu_misc_bus
> -            - const: dout_cmu_misc_sss
> +            - const: bus
> +            - const: sss
>
>  additionalProperties: false
>
> --
> 2.43.0.472.g3155946c3a-goog
>
