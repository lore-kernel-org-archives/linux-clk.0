Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52FF4D17B1
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832220; cv=none; b=PYrvUBNGl48M6iW3TRvhRHhhCJHG/Q5CWSlUPunx5K90W5OVLLjjFQWyxByp1dP3GIthtTdy/SPt2BeJJVe41xrgriTPsBu8gqZ+hTH3cJFtRGWDejZd7grlM/PicpcslH3KPgqRwveeQzQeJuA7c21h+qIirdn48WmcNgB19G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832220; c=relaxed/simple;
	bh=0++OQnsnodoFBA+6JtVfiCpmPpE/uYI2by4VMWbbVt0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=En1VJQBPgA/AG8k9/rce2eWUFRBfUOazpq7C1MZP2Ev5O0GFv+Cmb4jUlXoS1ZlOwLfRboxBYd1TLFIb+YRfycriTkpHXs+uPoKQIEuGIxEivh03rwSKvHRl950Ge70hFkURaaGR1nNCeCba/qLK5OJYZMFQKFXQDQU80Qn4X+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NOugOiSC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NOugOiSC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1215708f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791832217; x=1792437017; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7OMJ6SPz0N9qiO7f7FRcF4sIfMyC3KFW6sFDXfK2+0Q=;
        b=NOugOiSCTSMWU0cMd03TBYvIYlf1Jup6TameJJ/jlAiOUqVz5AEzKcj1wh0nrfhoBP
         K65eFJ3+E+qQXJ5nIs17eSlpUtmPtj/H9AOpsgG65N7cA/97zmwM85UbhEPBe8IybOxY
         utNor2haU2ekldstbHcxkI+I5d/CuOwXxdEs8c+PF+QcSM2V8IHKPY8tGCw2KEs3svwG
         3dEtw4zX5Pa4XKPB9Q4J/rS8+qGSg8/Q0iWQCSFMPOpIOQ43T/1DHUOWSeqq0x/p2OVu
         EsdwZ+JuHO9Y87Z93/DC8XkozO7xZZiklUfJI/SSk82y96QVosiaqM1F0RgHUjhmd4Ui
         l9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832217; x=1792437017;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OMJ6SPz0N9qiO7f7FRcF4sIfMyC3KFW6sFDXfK2+0Q=;
        b=cyb06vBGQvT09UGvLUAooQmoCDbDgNJ0cI+zhtN200z60dhg5FznxDB0xgzI2CxCFP
         BwWpm/2CqoWzZZ87IuHXx+nxythpIJ1IURGtqR4FrZY0Aatwt8IIILhQ9wXO7zzpdgxp
         JWrKbgUmOp1KwxOsMNu7xCFOEFY98+rhMtWGbqFd5h8dbDCClxZZ+vY99vrcrMQIycGS
         7hSzm8ThQeRaazf7Y7qlgPUbIjf5/hHhMG76qk1WZ8mJImn4+iK6p1pcxio8yJZzQdki
         cZ7G5228cU/9JOdgkdWtSMyqxcDWDvHLMRArEHRc0yzvKEZRejWD0YBsbsFUmx5dF/OA
         uIJg==
X-Forwarded-Encrypted: i=1; AKwUvBwO76HJYi66CHoPYmuuIDjH1/o+7ufOGmtLjK3lnRrI0tRCi49T3bBbV4uStk6s5LiTeT5X5vYQj8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMzol51yvVDlJ8DBgn6mAbb+zks1LkHsimG8FKpPDpUhIulMx9
	jfT0wMT46z4tt33zahFsL8gEDkUUPk9MUP4MGLOyel81qV9VhZskZlokQrUeDAYc6hk=
X-Gm-Gg: AYBFou2SNdyhuGLaXdEonMrOBhnw8T6zomeXm+IZv00UlVW/rJuGfLXQY/Mwkz5DAow
	T3WIBP8JDYwzrRnWowubD5MFkPSVVMwBoASaK0wYb9/4gAJKanTmPbD3RtREx8oSHADMhiKk19f
	Cm01TqAt+2EIzq/501XKbqkI92wxpX8dtJQ2BwJcCoR7Px+naEfvxBDA35hVxp2fFroKeILK3gq
	uTnFg5fvoXfAO+BIp3xTHMhn17m9DDTmZD7drpaYS57F1+IkzimjnQI5JaN1YTMb2GRG65u0DpC
	CebzhWQaYGit8qRObeJrpokFyOoQGsYcu0zisWEQ3ZZlD3EOXsVAgbHry8Zd/XUNdnYYG2XMrwH
	7khtIOsIpl23VxmcWC0RlDeQHMw+sckvnoRHhcv9sXhHoKENG1zkL3TNWblmKFz86FSS7Qn3RiY
	M1YMWfLhnBH25IuvXnoWfhFVK+CUQBWrsLQJ02sgPMwYqpB2QKyX340X8GtKNj1IOrhTiFmIwoS
	oqmjgYBDqPBYh6FsQ==
X-Received: by 2002:a05:6000:470f:b0:48b:74b:4ce1 with SMTP id ffacd0b85a97d-48dbad00328mr17013251f8f.32.1791832217095;
        Mon, 12 Oct 2026 12:10:17 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc91e2sm854527f8f.55.2026.10.12.12.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/4] clk: introduce TC9564 clock support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com, 
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012152408.3729237-1-elder@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
Date: Mon, 12 Oct 2026 21:10:02 +0200
Message-Id: <179183220207.266355.4262660703229090399.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0++OQnsnodoFBA+6JtVfiCpmPpE/uYI2by4VMWbbVt0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnDXqKk5oKeaK1dwRzL8wylpbZcavZWlv3/rw1Mnpff
 av/c/zoKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwESWOzH893h4YJK4smjWDC21
 a2bH1i5YW3SO7U6qdqymb2FOrUP0Z0aGzV99tOwevdI5kM+o35D3p9jw1hGRoy41nO+2XlhzLsy
 FFwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series adds support for the clock controller present within
> the Toshiba TC9564 SoC.
> 
> This SoC attaches to a host system via PCIe.  It includes a PCIe
> switch with three downstream ports.  To one of these ports an
> embedded PCIe endpoint is attached, and it implements two PCI
> functions.  BAR 4 for both PCI functions provides access to the
> registers that enable or disable a set of clocks.
> 
> Both TC9564 PCI functions can provide PCI endpoint buses via
> devicetree.  Each PCI endpoint bus provides access to one of the
> function's BARs.  Subordinate devices (like the clock controller)
> can then be defined as nodes accessible on the endpoint bus.
> 
> Only one of the two PCI functions is permitted to define the clock
> device node.
> 
> 					-Alex
> 
> NOTE:
>     This series is built upon linux-next, with this patch applied:
>       https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/

next AND a patch on top ?? you are not making this easy and this is mostly
to accommodate the DT change that could have been sent separately.

Basing on linux-next means there are other deps and you just did not explain.
This makes it very difficult for me to apply your series if I wanted to.

Next time around, please send a series on the clk list with only the 2 first
change. That way we do not have to cherry pick, we can use your cover letter
for the merge commit, which makes it easier to provide an immutable branch
to another subsystem, if need be.

*Clearly* list you dependencies if any. Please consider using b4 to list
the pre-requisite.

Thanks

-- 
Jerome

