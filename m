Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E336D512
	for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763842023; cv=none; b=INE65wv0CQ4BurCfVJLFuYUljJnq65vZziSm0FeLIbTOb8lB+d/j4I1gM4xbzVjxN0VWQGsF31z/PerklhI8aGhsP1JHXJWfUMa9AfkaZ1yB4a4t4k5+swM/A1U0323WYnLYskD2/QmcUtvy4sfzFoglWpJz5WQ1lPeGcMsQs3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763842023; c=relaxed/simple;
	bh=BfOGTFe2RDdikzJaB8b7S+Xxbnvnlg0I6+3xBKNkkJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qrey3I5DJ0mgBzrhJE1HqDaVCjiuc0mRsqqyajqWMQHvqTmA1rjFCCfQGeoGaq05Z1AU0MytStAN8wemx9b3qHKGvat4rCPPc0iYEejz1v4jxbp2vTXH/e/hboaMxql+dMmXOjFp4obCvbJ8xZwXF0Eh83jrp2GW8S/4kMldMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAcox4cV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAcox4cV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477770019e4so28117185e9.3
        for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 12:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763842020; x=1764446820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=scbiovI1ofyVHzq2gs5GMumOlOFIE2l40+/m1mFDagg=;
        b=HAcox4cVzUyMEVfRm2JF8HPXyufZRNhwaGoZXGRk6CPfUX8hVT3uYeipPRrUiyjM+Q
         VFREQLw0b0d7XCt2CThqNG3/TqqNRhstGeXjc85jo8Opy/el66Ljy0G9NmG72VBbtXas
         +NAM09MLZoT9NhXhPPIUnWm+02WNJxvExd6yQIEx6+g9RMVsHOZYdA4afLBTjEfxaUTK
         JjCfuUt+G/Z7yIL9sDJidnu0pYiBPl5eGt/Dl4Db5nVL06IaE2ny1tEPa5Q390WQF63n
         X8+aK/NZbA6CJUMaCVj5C6U05UePteD4i09XXO/pzYaFU1icNagBxG0HtfUuUWLbBTVK
         ntFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763842020; x=1764446820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scbiovI1ofyVHzq2gs5GMumOlOFIE2l40+/m1mFDagg=;
        b=vDdJbbn0+GSSpl3PP7PZcg+rbe7VO71KvUtFtEqWaI3muB5NWVjSepVFifOnhc+Afi
         CXFfulmqyJA2DeXZ6p2IBSXwkdwCg23uJYXY9SdU9cJgQZCx2fiYwztbqIdOSgIMuZre
         Hh2pTfjiKlz/RGZpk7zT6nIJLrOb8V2eFYNh4vgR1TWx4FWFSednNTtvptYgj0p06ldu
         XeSyfvp9MHTtrnoVE+LSdb0ULSw0ynE5kOvEx5gl4jdYS3/JNV31JewkyQorDiuwZ9Vf
         akJQYAAATzWyegXxDNBJ56QDCiBZ8SywX4WFcGgKJIFLfHvz9SppIYh2a8rwD0cU9ATp
         jnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEl7WJUUtTsdCtWce1EV6NNPWNIV7XwWQJjQ4/PqhZKJ0BXd4AzxOzxv+s5rfuINBqVRSg69Dg1PY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6x0z3U5HQnyc7p85kDqK+/i9Ag9P1g7O/f1JdBvBEqBZQKnRM
	UFdUZYnNvcIpaX7z82qg97XAiM5w538XHtPufD2zQCljbFwv7KZgOScFRLqIhk4TmiU=
X-Gm-Gg: ASbGnctUjFu+n3cGmpdXSlFqIJa/unb9tvmdhVEwPzGoXO5l7sem2LMIJ28nIwfVxXy
	P/YBKhjLPJgNdgxHxIfq39fvF2XsAXc6aD858JDK9CFwsnZ+BVpkphcawSj67CBu4rVJi8pG3gT
	Q/sBmPjr1wc7GSD3afoZwvTV7slYeRZE5zRTWrG27dkhVoAmq6cVDfMYzhCQn1JfgpbRgosudj6
	rk1cwvOpuBp3MCIneePpvmoY8SxBBxkLIdfTrj5M9wXYhd0Fl5wT6o18puChwFa2+sBa6XWg77J
	l6OzVH+ihoxWnlEwVax4/72VO2fPeQCuPVmOsHV5dzYJzgF1klygPnLr//eXmsUC2ucaEAQ34ve
	7kG2OA3vqo8c1W3qAfweBZMTYsZIV/Y+QnflbLM/pH11ahatjdFKfUePC+Zd3HMq7KzqfDYYI6L
	hvolRndwY=
X-Google-Smtp-Source: AGHT+IEkdNyBisXIocC7/wQzw62k7sUipLUjv7aKHG865BoRXs3aebU7fEY/rhvatBXJb770s/EvTw==
X-Received: by 2002:a05:600c:a01:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-477c01f5980mr57357315e9.33.1763842020168;
        Sat, 22 Nov 2025 12:07:00 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18445335f8f.32.2025.11.22.12.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 12:06:59 -0800 (PST)
Date: Sat, 22 Nov 2025 22:06:57 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
Message-ID: <sskqfkm2ui4a44w2y7nra5vpdml6tqsxsyrahwvbi3f3tovfad@kql6fm3mwyqq>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>

On 25-11-21 23:26:28, Taniya Das wrote:
> Add the TCSR clock controller that provides the refclks on Kaanapali
> platform for PCIe, USB and UFS subsystems.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
