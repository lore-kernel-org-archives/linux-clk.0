Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FJ8iiyw0"
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CBEFA
	for <linux-clk@vger.kernel.org>; Tue,  5 Dec 2023 00:26:55 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40bd5eaa66eso35057645e9.3
        for <linux-clk@vger.kernel.org>; Tue, 05 Dec 2023 00:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701764813; x=1702369613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xo+/EwDShXw+0ErTm/Pk49sbvWBMtU3LMyMVMefHxA=;
        b=FJ8iiyw0vD3N3LPvwAK07sWQO+FgnHAPSFzXjeYas1sJi8fW7acyzSl24KGFJZNEVx
         dxYfmtmu9peGfyxpiPMGRIckdt6v5FQIbPnhYkeV9cS6Wfa4uphlaWPmy0XLnFRPLN09
         ETdnGZ+vAtw/4nyilHPxNU0s001lQTWs90Gny5bRThe/pVQ6+zR9ewo+p7cML1w50wTt
         glwXyLI+54EqXsux+dAzmhCuFifpNiYxvIQ4NgVQkFCBq4DVpxIRSgMfX/6QxcPprMzw
         QYPmpcLge8MDApzJ39ZPL+ecdcc9W2iVcnxJ2H15Mqx+NST1B6UX20AsMKvGEk7TUe9a
         7Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701764813; x=1702369613;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xo+/EwDShXw+0ErTm/Pk49sbvWBMtU3LMyMVMefHxA=;
        b=chpy+AUvmrtqCcMSLKjPJER12Kr4QElIB3KTxd2eXrDiv6s5F0uF6PcH7wCsxqlLHf
         nMHqqs5UHgGVY+/rFlhrWA2RAjFTb7WJ4if6ALJlyVxNnuFJXazWltTdVGhXW6SJpLqj
         rxMd4vNwPaYbzgpGweRXlJp0wGMVLr42QwjLQ1shnitd28ZI5Z3g7aBhq4q+Y/HZuJIz
         2fZL8Yo3Ra1bBj6sK2Zd2bzy6OURPl/8Ty0jlBU/jjQFkb18WGQj79kSdZRp2BQhN8oa
         kCWB0/TVYaqSGdFM70DuaVisfuuun4BFe5pjXLUCsOALHAbVnwND15OBs6ijQz3R8hDV
         lD5w==
X-Gm-Message-State: AOJu0YwldMnt/OqnDxb+NUFtuHPSMiaaEFYz12mj0Y0QfIGdcUt9Odw5
	G9Bjw9DqLiR5LGk/u1OFOOb0ZQ==
X-Google-Smtp-Source: AGHT+IHm8d3BCfIGqE69y8jUoy6J3Kzb+QtEPPQ+oGlTFuH/rWCx6J2gokcJ9ngcoHN+c1BW732iPw==
X-Received: by 2002:a05:600c:4655:b0:40b:5e1c:5c1f with SMTP id n21-20020a05600c465500b0040b5e1c5c1fmr234872wmo.52.1701764813586;
        Tue, 05 Dec 2023 00:26:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d4-20020a05600c3ac400b0040b538047b4sm21329282wms.3.2023.12.05.00.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 00:26:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-rockchip@lists.infradead.org, 
 Chris Morgan <macroalpha82@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org, 
 quic_jesszhan@quicinc.com, javierm@redhat.com, heiko@sntech.de, 
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
Subject: Re: [PATCH V2 00/10] rockchip: Add Powkiddy X55
Message-Id: <170176481258.4073725.14793788958228896320.b4-ty@linaro.org>
Date: Tue, 05 Dec 2023 09:26:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

Hi,

On Mon, 04 Dec 2023 12:57:09 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Rockchip RK3566 based Powkiddy X55 handheld gaming
> console.
> 
> Changes since V1:
>  - Corrected a bug with the DRM mode flags for the video driver.
>  - Adjusted panel front and back porch and pixel clock to fix
>    issues with display that occurred after correcting DRM mode
>    flag bug.
>  - Add a new clk frequency for PLL_VPLL to get panel to run at ~60hz.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[01/10] drm/panel: himax-hx8394: Drop prepare/unprepare tracking
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8c2c5d1d33f0725b7995f44f87a81311d13a441d
[02/10] drm/panel: himax-hx8394: Drop shutdown logic
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e4f53a4d921eba6187a2599cf184a3beeb604fe2
[03/10] dt-bindings: display: Document Himax HX8394 panel rotation
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=be478bc7ab08127473ce9ed893378cc2a8762611
[04/10] drm/panel: himax-hx8394: Add Panel Rotation Support
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a695a5009c8fd239a98d98209489997ff5397d2b
[05/10] dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=00830a0d8f0d820335e7beb26e251069d90f2574
[06/10] drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=38db985966d2f0f89f7e1891253489a16936fc5e
[07/10] clk: rockchip: Mark pclk_usb as critical on rk3568
        (no commit info)
[08/10] clk: rockchip: rk3568: Add PLL rate for 126.4MHz
        (no commit info)
[09/10] dt-bindings: arm: rockchip: Add Powkiddy X55
        (no commit info)
[10/10] arm64: dts: rockchip: Add Powkiddy X55
        (no commit info)

-- 
Neil

